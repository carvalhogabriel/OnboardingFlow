import Quick
import Nimble
import Nimble_Snapshots

@testable import Flow

class CPFViewSpec: QuickSpec {

    override func spec() {

        var sut: CPFView!
        let cpfViewModel = CPFViewModel(cpf: "123.456.789-00")

        beforeSuite {
            sut = CPFView(viewModel: cpfViewModel)
        }

        describe("CPFViewSpec") {

            beforeEach {
                let frame = CGRect(x: 0,
                                   y: 0,
                                   width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height)
                sut.frame = frame
            }

            context("when layout was initialized") {
                it("should have the specific layout") {
                    expect(sut) == snapshot("CPFViewSpec")
                }
            }
        }
    }

}
