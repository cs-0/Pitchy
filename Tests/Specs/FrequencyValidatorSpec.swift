@testable import Pitchy
import Quick
import Nimble

class FrequencyValidatorSpec: QuickSpec {
    func spec() {
        Self.describe("FrequencyValidator") {
            Self.describe(".isValid:frequency") {
                Self.it("is invalid if frequency is higher than maximum") {
                    let frequency = 5000.0
                    expect(FrequencyValidator.isValid(frequency: frequency)).to(beFalse())
                }
                
                Self.it("is invalid if frequency is lower than minimum") {
                    let frequency = 10.0
                    expect(FrequencyValidator.isValid(frequency: frequency)).to(beFalse())
                }
                
                Self.it("is invalid if frequency is zero") {
                    let frequency = 0.0
                    expect(FrequencyValidator.isValid(frequency: frequency)).to(beFalse())
                }
                
                Self.it("is valid if frequency is within valid bounds") {
                    let frequency = 440.0
                    expect(FrequencyValidator.isValid(frequency: frequency)).to(beTrue())
                }
            }
        }
    }
}
