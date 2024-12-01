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
        totalStarsAvailable: 100,
        lessons: [
            Lesson(
                id: "lesson1",
                title: "Lesson 1 - First Tone",
                lessonOrder: 1,
                totalStarsAvailable: 25,
                content: [
                    "The First Tone is called 一声 (yīshēng), meaning the first sound.",
                    "It starts high and maintains the same high pitch throughout the process. So it sounds high and flat. That is why it is also known as 'The High Level Tone.'",
                    "It is impossible even for native speakers to maintain a perfectly flat pitch throughout. Variations will exist, but should always follow the general principle, which is high and flat.",
                    "Imagine you're at the dentist, and they ask you to open your mouth wide and say 'aaaaa.' You maintain a steady, flat pitch throughout. This is how Tone One works in Mandarin—it’s high, level, and consistent.",
                    "For example, when you say 啊 (ā), it sounds calm and steady, just like that 'aaaaa' at the dentist."
                ],
                words: [
                  Word(
                        id: "word1",
                        pinyin: "mā",
                        word: "妈",
                        translation: "Mom",
                        audioPath: "/audio/foundations/M1L1_ma1.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your pitch level and even.",
                            incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
                        ),
                        transcriptionCheck: Formants(F1: 642.6, F2: 1153.4),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [142.8, 146.4, 148.7, 151.4, 149.4, 152.0, 153.3, 152.5, 149.5, 149.4, 150.4, 150.9, 150.4, 149.5, 149.5, 149.4, 150.2, 149.9, 151.5, 153.3],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word2",
                        pinyin: "bā",
                        word: "八",
                        translation: "Eight",
                        audioPath: "/audio/foundations/M1L1_ba1.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your pitch level and even.",
                            incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
                        ),
                        transcriptionCheck: Formants(F1: 778.8, F2: 1198.1),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [149.1, 148.5, 148.5, 148.2, 147.8, 148.2, 149.0, 150.0, 150.7, 151.3, 151.3, 150.9, 150.3, 149.9, 149.6, 149.3, 149.6, 150.8, 152.0, 155.4],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word3",
                        pinyin: "tā",
                        word: "她",
                        translation: "She",
                        audioPath: "/audio/foundations/M1L1_ta1.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your pitch level and even.",
                            incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
                        ),
                        transcriptionCheck: Formants(F1: 773.4, F2: 1255.1),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [153.7, 152.5, 149.0, 148.3, 148.0, 148.2, 148.4, 149.2, 150.2, 151.1, 151.2, 150.2, 149.5, 149.7, 149.3, 149.6, 149.8, 148.8, 149.9, 153.3],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word4",
                        pinyin: "yā",
                        word: "鸭",
                        translation: "Duck",
                        audioPath: "/audio/foundations/M1L1_ya1.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your pitch level and even.",
                            incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
                        ),
                        transcriptionCheck: Formants(F1: 644.3, F2: 1564.2),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [139.7, 148.5, 148.9, 152.6, 155.5, 149.7, 148.5, 148.9, 149.2, 150.2, 151.1, 152.2, 150.8, 149.6, 149.1, 149.3, 150.2, 150.0, 151.0, 154.6],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word5",
                        pinyin: "yī",
                        word: "一",
                        translation: "One",
                        audioPath: "/audio/foundations/M1L1_yi1.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Keep your pitch level and even.",
                            incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
                        ),
                        transcriptionCheck: Formants(F1: 249.7, F2: 2429.2),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
                        userPitchVectors: []
                    )
                ]
            ),
            Lesson(
                id: "lesson2",
                title: "Lesson 2 - Second Tone",
                lessonOrder: 2,
                totalStarsAvailable: 25,
                content: [
                    "The Second Tone is called 二声 (èrshēng). It starts semi-high and goes up. It is also called 'The Middle Rising Tone.'",
                    "To produce the sound, think of a moment when you’re confused or surprised, and you say 'Whaaat?' in English with your voice rising upward. In Mandarin, Tone Two works the same way.",
                    "For instance, when you say 啊 (á), it rises sharply, almost as if you’re questioning or seeking clarification."
                ],
                words: [
                    Word(
                        id: "word1",
                        pinyin: "má",
                        word: "麻",
                        translation: "Hemp",
                        audioPath: "/audio/foundations/M1L2_ma2.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Your pitch should rise steadily.",
                            incorrectPronunciation: "Ensure your tone rises sharply like a question."
                        ),
                        transcriptionCheck: Formants(F1: 715.6, F2: 1152.8),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [145.1, 145.8, 143.3, 140.2, 140.4, 141.1, 140.2, 139.5, 139.4, 141.1, 143.2, 145.6, 147.8, 150.9, 154.2, 156.9, 158.6, 160.8, 174.1, 192.4],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word2",
                        pinyin: "yá",
                        word: "牙",
                        translation: "Teeth",
                        audioPath: "/audio/foundations/M1L2_ya2.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Your pitch should rise steadily.",
                            incorrectPronunciation: "Ensure your tone rises sharply like a question."
                        ),
                        transcriptionCheck: Formants(F1: 636.2, F2: 1534.9),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [148.7, 148.1, 150.3, 145.4, 140.0, 139.3, 139.2, 139.4, 140.3, 141.0, 141.1, 141.8, 143.0, 145.7, 149.6, 153.3, 157.0, 170.4, 180.9, 184.6],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word3",
                        pinyin: "chá",
                        word: "茶",
                        translation: "Tea",
                        audioPath: "/audio/foundations/M1L2_cha2.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Your pitch should rise steadily.",
                            incorrectPronunciation: "Ensure your tone rises sharply like a question."
                        ),
                        transcriptionCheck: Formants(F1: 791.9, F2: 1244.5),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [140.8, 139.4, 137.9, 138.5, 138.2, 139.2, 139.7, 140.8, 141.5, 143.4, 145.5, 146.6, 149.0, 151.6, 154.6, 156.6, 158.7, 171.6, 182.1, 184.3],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word4",
                        pinyin: "lí",
                        word: "梨",
                        translation: "Pear",
                        audioPath: "/audio/foundations/M1L2_li2.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Your pitch should rise steadily.",
                            incorrectPronunciation: "Ensure your tone rises sharply like a question."
                        ),
                        transcriptionCheck: Formants(F1: 312.2, F2: 2250.8),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [134.3, 140.0, 143.6, 144.7, 145.1, 143.8, 143.0, 142.5, 142.9, 143.5, 144.6, 146.7, 148.6, 151.9, 153.6, 154.7, 160.6, 167.7, 172.5, 174.8],
                        userPitchVectors: []
                    ),
                    Word(
                        id: "word5",
                        pinyin: "dí",
                        word: "笛",
                        translation: "Flute",
                        audioPath: "/audio/foundations/M1L2_di2.wav",
                        starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                        feedback: Feedback(
                            incorrectPitch: "Your pitch should rise steadily.",
                            incorrectPronunciation: "Ensure your tone rises sharply like a question."
                        ),
                        transcriptionCheck: Formants(F1: 267.4, F2: 2352.8),
                        voiceProcessingCheck: nil,
                        starValue: 5,
                        replayAllowed: true,
                        samplePitchVectors: [157.8, 146.0, 145.1, 143.9, 140.8, 139.4, 138.7, 140.5, 141.6, 142.2, 143.2, 145.1, 147.3, 150.5, 152.7, 155.6, 160.3, 163.8, 170.1, 174.8],
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
