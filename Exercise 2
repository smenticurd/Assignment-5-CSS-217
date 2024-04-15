import Foundation

class Data {
    var type: String
    var content: Any
    
    init(type: String, content: Any) {
        self.type = type
        self.content = content
    }
}

class DataProcessor {
    func process(data: Data) {
        fatalError("This method must be overridden")
    }
}

class TextDataProcessor: DataProcessor {
    override func process(data: Data) {
        guard let textContent = data.content as? String else {
            fatalError("Invalid content type for text data")
        }
        print("Processing text data: \(textContent)")
    }
}

class AudioDataProcessor: DataProcessor {
    override func process(data: Data) {
        guard let audioContent = data.content as? String else {
            fatalError("Invalid content type for audio data")
        }
        print("Processing audio data: \(audioContent)")
    }
}

class VideoDataProcessor: DataProcessor {
    override func process(data: Data) {
        guard let videoContent = data.content as? String else {
            fatalError("Invalid content type for video data")
        }
        print("Processing video data: \(videoContent)")
    }
}

class DataProcessorCreator {
    private var processor: DataProcessor
    
    init(processor: DataProcessor) {
        self.processor = processor
    }
    
    func setProcessor(processor: DataProcessor) {
        self.processor = processor
    }
    
    func processData(data: Data) {
        processor.process(data: data)
    }
}

let textProcessor = TextDataProcessor()
let audioProcessor = AudioDataProcessor()
let videoProcessor = VideoDataProcessor()

let dataProcessorCreator = DataProcessorCreator(processor: textProcessor)

let textData = Data(type: "text", content: "This is a sample text.")
dataProcessorCreator.processData(data: textData)

let audioData = Data(type: "audio", content: "Audio data")
dataProcessorCreator.setProcessor(processor: audioProcessor)
dataProcessorCreator.processData(data: audioData)

let videoData = Data(type: "video", content: "Video data")
dataProcessorCreator.setProcessor(processor: videoProcessor)
dataProcessorCreator.processData(data: videoData)

