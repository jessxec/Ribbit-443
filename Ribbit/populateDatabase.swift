//
//  populateDatabase.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/7/24.
//

import FirebaseFirestore

func createModules() async throws {
    let db = Firestore.firestore()

    // Module: Foundations Island
    let foundationsModule = Module(
        id: "foundationsIsland",
        title: "Foundations Island",
        starsRequired: 0,
        isUnlocked: true,
        totalStarsAvailable: 50, // Adjust based on actual star system
        lessons: [
            Lesson(
                id: "lesson1",
                title: "Lesson 1 - First Tone",
                lessonOrder: 1,
                totalStarsAvailable: 25, // Adjust as needed
                words: [
                    Word(
                        id: "word1",
                        pinyin: "bā",
                        word: "八",
                        translation: "eight",
                        audioPath: "/audio/foundations/ba1_MV1_MP3.mp3", // Corrected path
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your pitch level and even.",
                            incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
                        ),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [154.4,150.0,148.1,148.6,148.4,147.8,148.3,149.3,150.0,150.6,150.3,150.4,150.9,150.6,148.7,147.3,148.4,150.1,152.8,155.5],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word2",
                        pinyin: "fā",
                        word: "发",
                        translation: "give",
                        audioPath: "/audio/foundations/fa1_MV1_MP3.mp3", // Corrected path
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Try to maintain a consistent pitch.",
                            incorrectPronunciation: "Use a flat tone without changing pitch."
                        ),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [159.4,157.5,152.8,151.1,150.0,149.2,149.0,148.8,148.1,148.0,147.8,147.7,147.0,147.3,146.3,145.9,146.5,149.1,153.8,155.1],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word3",
                        pinyin: "mā",
                        word: "妈",
                        translation: "mother",
                        audioPath: "/audio/foundations/ma1_MV1_MP3.mp3", // Corrected path
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Focus on a steady, level pitch.",
                            incorrectPronunciation: "Remember to keep the tone flat and even."
                        ),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [151.0,139.1,140.0,144.5,143.1,145.1,148.5,150.2,151.0,152.5,153.1,151.6,151.0,152.3,155.0,156.0,155.7,152.6,152.7,154.6],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word4",
                        pinyin: "yā",
                        word: "鸭",
                        translation: "duck",
                        audioPath: "/audio/foundations/ya1_MV1_MP3.mp3", // Corrected path
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Ensure a steady, unvarying pitch.",
                            incorrectPronunciation: "Use a flat tone, without any rising or falling."
                        ),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [152.9,141.4,133.3,134.9,145.0,154.4,155.0,153.0,153.7,153.9,155.1,156.2,155.1,152.5,151.0,146.9,145.6,150.0,152.2,157.0],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word5",
                        pinyin: "māo",
                        word: "猫",
                        translation: "cat",
                        audioPath: "/audio/foundations/mao1_MV1_MP3.mp3", // Corrected path
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your tone level and consistent.",
                            incorrectPronunciation: "Use an even tone without variation."
                        ),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [141.6,133.3,136.1,140.4,145.1,148.1,149.2,148.5,150.0,152.3,154.8,156.4,157.0,157.5,156.0,155.4,152.0,152.1,154.6,158.8],
                        userPitchVectors: []
                    )
                ]
            )
        ]
    )

    // Upload to Firebase
    let moduleData = try Firestore.Encoder().encode(foundationsModule)
    try await db.collection("Modules").document(foundationsModule.id!).setData(moduleData)
    print("Module and lesson content uploaded successfully.")
}
