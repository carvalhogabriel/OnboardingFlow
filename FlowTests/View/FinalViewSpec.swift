import Quick
import Nimble
import Nimble_Snapshots

@testable import Flow

class FinalViewSpec: QuickSpec {

    var sut: FinalView!
    var userViewModel = UserViewModel()

    override func spec() {

        beforeSuite {
            self.fillUserViewModel()
            self.sut = FinalView(viewModel: self.userViewModel)
            self.fillFinalView(withUserViewModel: self.userViewModel)
        }

        describe("FinalViewSpec") {

            beforeEach {
                let frame = CGRect(x: 0,
                                   y: 0,
                                   width: UIScreen.main.bounds.width,
                                   height: UIScreen.main.bounds.height)
                self.sut.frame = frame
            }

            context("when layout was initialized") {

                it("should have a specific layout") {
                    expect(self.sut) == snapshot("FinalViewSpec")
                }

            }

        }
        
    }
    
}

extension FinalViewSpec {

    func fillUserViewModel() {
        userViewModel.nameViewModel = NameViewModel(name: "João")
        userViewModel.cpfViewModel = CPFViewModel(cpf: "123.456.789-00")
        userViewModel.emailViewModel = EmailViewModel(email: "email@email.com")
    }

    func fillFinalView(withUserViewModel viewModel: UserViewModel) {
        sut.nameLabel.text = "Nome: \(viewModel.nameViewModel.name)"
        sut.cpfLabel.text = "CPF: \(viewModel.cpfViewModel.cpf)"
        sut.emailLabel.text = "Email: \(viewModel.emailViewModel.email)"
    }

}
