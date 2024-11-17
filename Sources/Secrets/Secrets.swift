import Foundation

// First, let's create a function to get the Documents directory path
func getDocumentsDirectory() -> URL {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}

// Function to read and parse the API key from keys.json
public func getAPIKey(key: String) -> String? {
    let fileURL = getDocumentsDirectory().appendingPathComponent("keys.json")
    
    do {
        // Read the file content
        let data = try Data(contentsOf: fileURL)
        
        // Parse JSON
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: String],
           let apiKey = json[key] {
            return apiKey
        }
    } catch {
        print("Error reading keys.json: \(error)")
    }
    
    return nil
}
