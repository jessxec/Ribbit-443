//
//  DataPopulation.swift
//  Ribbit
//
//  Created by Jorge Urias on 11/5/24.
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
                        audioPath: "/audio/foundations/ba1_MV1_MP3.wav", // Corrected path
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your pitch level and even.",
                            incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
                        ),
                        transcriptionCheck: nil,
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true
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
                        replayAllowed: true
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
                        replayAllowed: true
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
                        replayAllowed: true
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
                        replayAllowed: true
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

