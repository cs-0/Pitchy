@testable import Pitchy
import Quick
import Nimble

class AcousticWaveSpec: QuickSpec {
    
    func spec() {
        let waves = [
            (frequency: 440.0,
             wavelength: 0.7795,
             period: 0.00227259
            ),
            (frequency: 1000.0,
             wavelength: 0.343,
             period: 0.001
            )
        ]
        
        Self.describe("AcousticWave") {
            Self.describe(".speed") {
                expect(AcousticWave.speed) ≈ (343, 0.001)
            }
            
            Self.describe("#init") {
                Self.context("with frequency") {
                    Self.it("sets correct values") {
                        waves.forEach {
                            let wave = try! AcousticWave(frequency: $0.frequency)
                            
                            expect(wave.frequency) ≈ ($0.frequency, 0.01)
                            expect(wave.wavelength) ≈ ($0.wavelength, 0.01)
                            expect(wave.period) ≈ ($0.period, 0.01)
                            
                            for (index, value) in wave.harmonics.enumerated() {
                                expect(value.frequency) ≈ (Double(index + 1) * $0.frequency, 0.01)
                            }
                        }
                    }
                }
                
                Self.context("with wavelength") {
                    Self.it("sets correct values") {
                        waves.forEach {
                            let wave = try! AcousticWave(wavelength: $0.wavelength)
                            
                            expect(wave.frequency) ≈ ($0.frequency, 0.1)
                            expect(wave.wavelength) ≈ ($0.wavelength, 0.01)
                            expect(wave.period) ≈ ($0.period, 0.01)
                            
                            for (index, value) in wave.harmonics.enumerated() {
                                expect(value.frequency) ≈ (Double(index + 1) * $0.frequency, 1)
                            }
                        }
                    }
                }
                
                Self.context("with period") {
                    Self.it("sets correct values") {
                        waves.forEach {
                            let wave = try! AcousticWave(period: $0.period)
                            
                            expect(wave.frequency) ≈ ($0.frequency, 0.1)
                            expect(wave.wavelength) ≈ ($0.wavelength, 0.01)
                            expect(wave.period) ≈ ($0.period, 0.01)
                            
                            for (index, value) in wave.harmonics.enumerated() {
                                expect(value.frequency) ≈ (Double(index + 1) * $0.frequency, 1)
                            }
                        }
                    }
                }
            }
        }
    }
}
