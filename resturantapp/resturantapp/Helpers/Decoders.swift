
import Foundation

final class LocalFileDataDecoder {
    let decoder = JSONDecoder()
    
    func decode<Template: Decodable>(fileName: String, fileExtension: String) throws -> Template {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            let data = try Data(contentsOf: url)
            let response = try decoder.decode(Template.self, from: data)
            return response
        } else {
            throw LocalFileError.absentFile
        }
    }
}
