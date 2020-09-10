import Quick
import Nimble
import Nimble_Snapshots

@testable import Flow

class NameViewSpec: QuickSpec {

    override func spec() {

//        let sizes = [ "iPhone8": SizesEnum.iphone8.sizes,
//                      "iPhoneX": SizesEnum.iphoneX.sizes,
//                      "iPhone11ProMax": SizesEnum.iphone11ProMax.sizes
//        ]

        var sut: NameView!
        let nameViewModel = NameViewModel(name: "Gabriel")

        beforeSuite {
            sut = NameView(viewModel: nameViewModel)
        }

        describe("NameViewSpec") {

            beforeEach {
                let frame = CGRect(x: 0,
                                   y: 0,
                                   width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height)
                sut.frame = frame
            }

            context("when layout was initialized") {
                it("should have the specific layout") {
                    expect(sut) == snapshot("NameViewSpec")
                }
            }

            /// Isso deve ser feito em um spec de view model
//            context("when fetching name") {
//                let nameViewModel = NameViewModel(name: "Gabriel")
//
//                beforeEach {
//                    nameViewModel.fetchRemoteName { (_) in
//                        //
//                    }
//                }
//
//                beforeEach {
//                    waitUntil(timeout: 30) { done in
//                        nameViewModel.fetchRemoteName { _ in
//                            done()
//                        }
//                    }
//                }
//
//                it("should have the name Jonatha") {
//                    expect(nameViewModel.name) == "Jonatha"
//                    expect(nameViewModel.name).toEventually(equal("Jonatha"), timeout: 30, pollInterval: 1)
//                }
//            }

//            expect(sut)
//                .to(haveValidDynamicSizeSnapshot(named: "NameViewSpec",
//                                                        sizes: sizes,
//                                                        isDeviceAgnostic: false,
//                                                        usesDrawRect: false,
//                                                        tolerance: 0,
//                                                        resizeMode: .frame))
        }
    }

}
