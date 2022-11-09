//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import XCTest
@testable import Earthquakes

class EarthquakesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFailureState() throws {
        let viewModel = EarthquakesViewModel(service: FailureService())
        
        let expectation = expectation(description: "State expectation")
        expectation.expectedFulfillmentCount = 2
        
        let cancellable = viewModel.$state.sink { newState in
            expectation.fulfill()
        }
        
        viewModel.load()
        
        wait(for: [expectation], timeout: 1)
        
        switch viewModel.state {
        case .failure:
            break
        default:
            XCTFail("Invalid state")
        }
        // if Equatable
//        XCTAssertEqual(viewModel.state, .failure)
    }
    
    func testLoadedState() throws {
        let viewModel = EarthquakesViewModel(service: MockService())
        
        let expectation = expectation(description: "State expectation")
        expectation.expectedFulfillmentCount = 2
        
        let cancellable = viewModel.$state.sink { newState in
            expectation.fulfill()
        }
        
        viewModel.load()
        
        wait(for: [expectation], timeout: 1)
        
        switch viewModel.state {
        case .loaded(let earthquakes):
            XCTAssertEqual(earthquakes.count, 1)
            XCTAssertEqual(earthquakes.first?.id, "123")
        default:
            XCTFail("Invalid state")
        }
        // if Equatable
//        XCTAssertEqual(viewModel.state, .failure)
    }
}

extension EarthquakesTests {
    enum TestError: Error {
        case test
    }
    
    final class FailureService: EarthquakesService {
        func load() async throws -> [EarthquakeModel] {
            throw TestError.test
        }
    }
    
    final class MockService: EarthquakesService {
        func load() async throws -> [EarthquakeModel] {
            return [EarthquakeModel(id: "123", src: "asd", magnitude: 5.5)]
        }
    }
}
