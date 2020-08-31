import Quick
import Nimble
import Nimble_Snapshots

@testable import Flow

class EmailViewSpec: QuickSpec {

    override func spec() {

        var sut: EmailView!
        let emailViewModel = EmailViewModel(email: "123.456.789-00")

        beforeSuite {
            sut = EmailView(viewModel: emailViewModel)
        }

        describe("EmailViewSpec") {

            beforeEach {
                let frame = CGRect(x: 0,
                                   y: 0,
                                   width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height)
                sut.frame = frame
            }

            context("when layout was initialized") {
                it("should have the specific layout") {
                    expect(sut) == snapshot("EmailViewSpec")
                }
            }
        }
    }

}
