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
          "It starts high and maintains the same high pitch throughout the process. So it sounds high and flat.",
          "Imagine you're at the dentist, and they ask you to open your mouth wide and say 'aaaaa.' This is how Tone One works in Mandarin."
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
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          ),
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
      ),
      Lesson(
          id: "lesson3",
          title: "Lesson 3 - Third Tone",
          lessonOrder: 3,
          totalStarsAvailable: 25,
          content: [
              "The Third Tone is called 三声 (sānshēng), meaning 'the third sound.' This tone is the most dynamic and complex, as it starts at a medium pitch, dips down, and then rises again. It is also called 'The Dipping Tone.'",
              "However, Tone Three is rarely pronounced exactly as the ideal graph shows. During the dip, your voice naturally becomes too low, irregular, and creaky for some pitch detection algorithms to capture accurately. In real speech, Tone Three often sounds like a low, flat tone, especially in fast or casual conversation.",
              "To master Tone Three, imagine a deep, thoughtful 'Hmm' sound. Your pitch will start mid-level, drop low, and then rise slightly at the end. When pronounced in isolation, Tone Three should always include the rising part. But when combined with other tones, the rising component may be less pronounced."
          ],
          words: [
              Word(
                  id: "word1",
                  pinyin: "mǎ",
                  word: "马",
                  translation: "Horse",
                  audioPath: "/audio/foundations/M1L3_ma3.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Ensure your pitch dips and rises slightly.",
                      incorrectPronunciation: "Your tone should have a noticeable dip before rising slightly."
                  ),
                  transcriptionCheck: Formants(F1: 781.9, F2: 1193.7),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [154.5, 155.0, 152.8, 149.9, 147.9, 142.0, 139.6, 139.2, 138.5, 137.5, 138.0, 138.8, 140.5, 144.6, 148.5, 153.5, 158.7, 164.3, 170.2, 185.3],
                  userPitchVectors: []
              ),
              Word(
                  id: "word2",
                  pinyin: "tǎ",
                  word: "塔",
                  translation: "Tower",
                  audioPath: "/audio/foundations/M1L3_ta3.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Ensure your pitch dips and rises slightly.",
                      incorrectPronunciation: "Your tone should have a noticeable dip before rising slightly."
                  ),
                  transcriptionCheck: Formants(F1: 835.4, F2: 1216.6),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [158.1, 159.2, 150.1, 146.6, 143.6, 141.7, 138.1, 138.7, 140.4, 140.5, 142.2, 142.8, 143.5, 143.4, 145.5, 151.5, 156.9, 164.7, 172.0, 179.6],
                  userPitchVectors: []
              ),
              Word(
                  id: "word3",
                  pinyin: "mǐ",
                  word: "米",
                  translation: "Rice",
                  audioPath: "/audio/foundations/M1L3_mi3.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Ensure your pitch dips and rises slightly.",
                      incorrectPronunciation: "Your tone should have a noticeable dip before rising slightly."
                  ),
                  transcriptionCheck: Formants(F1: 260.1, F2: 2274.3),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [156.0, 158.6, 158.0, 156.8, 154.5, 151.1, 148.6, 143.4, 140.2, 138.8, 138.3, 140.7, 142.8, 144.2, 145.4, 148.1, 155.0, 158.1, 160.5, 161.6],
                  userPitchVectors: []
              ),
              Word(
                  id: "word4",
                  pinyin: "nǐ",
                  word: "你",
                  translation: "You",
                  audioPath: "/audio/foundations/M1L3_ni3.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Ensure your pitch dips and rises slightly.",
                      incorrectPronunciation: "Your tone should have a noticeable dip before rising slightly."
                  ),
                  transcriptionCheck: Formants(F1: 279.5, F2: 2207.2),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [153.6, 158.3, 157.3, 155.2, 152.6, 149.6, 145.2, 142.9, 140.7, 138.1, 137.3, 137.6, 138.1, 140.9, 145.3, 150.7, 154.1, 160.7, 168.3, 173.1],
                  userPitchVectors: []
              ),
              Word(
                  id: "word5",
                  pinyin: "lǐ",
                  word: "李",
                  translation: "Plum / Last Name: Li",
                  audioPath: "/audio/foundations/M1L3_li3.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Ensure your pitch dips and rises slightly.",
                      incorrectPronunciation: "Your tone should have a noticeable dip before rising slightly."
                  ),
                  transcriptionCheck: Formants(F1: 261.0, F2: 2192.6),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [165.5, 155.1, 151.1, 147.9, 151.7, 150.0, 147.5, 144.2, 143.3, 141.7, 140.4, 139.3, 139.2, 140.9, 141.4, 146.6, 155.2, 161.5, 170.6, 167.7],
                  userPitchVectors: []
              )
          ]
      ),
      // Lesson 4 - Fourth Tone
      Lesson(
          id: "lesson4",
          title: "Lesson 4 - Fourth Tone",
          lessonOrder: 4,
          totalStarsAvailable: 25,
          content: [
              "The Fourth Tone is called 四声 (sìshēng), meaning 'the fourth sound.' It is sharp, decisive, and forceful, starting high and dropping quickly. This is why it is also known as 'The Falling Tone.'",
              "Tone Four is the easiest to recognize because of its dramatic, abrupt descent. Imagine giving a command like 'Stop!' or expressing frustration with 'No!' in English. Your voice falls quickly and firmly—this is exactly how Tone Four works in Mandarin.",
              "In Mandarin, Tone Four conveys emotions like decisiveness, urgency, or even irritation. However, it can also be neutral and factual depending on context."
          ],
          words: [
              Word(
                  id: "word1",
                  pinyin: "mà",
                  word: "骂",
                  translation: "Scold",
                  audioPath: "/audio/foundations/M1L4_ma4.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Your pitch should fall sharply.",
                      incorrectPronunciation: "Ensure your tone falls quickly and decisively."
                  ),
                  transcriptionCheck: Formants(F1: 852.2, F2: 1501.3),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [94.6, 93.2, 165.9, 167.2, 168.7, 169.5, 170.2, 170.6, 170.2, 169.2, 168.6, 167.1, 165.9, 164.8, 163.1, 160.4, 118.7, 119.0, 119.4, 113.8],
                  userPitchVectors: []
              ),
              Word(
                  id: "word2",
                  pinyin: "nà",
                  word: "那",
                  translation: "There",
                  audioPath: "/audio/foundations/M1L4_na4.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Your pitch should fall sharply.",
                      incorrectPronunciation: "Ensure your tone falls quickly and decisively."
                  ),
                  transcriptionCheck: Formants(F1: 700.0, F2: 1529.4),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [161.5, 162.6, 164.2, 166.9, 167.7, 168.6, 168.3, 166.5, 163.4, 162.0, 159.7, 158.6, 155.8, 140.4, 140.8, 125.3, 125.3, 114.0, 114.3, 114.7],
                  userPitchVectors: []
              ),
              Word(
                  id: "word3",
                  pinyin: "yì",
                  word: "翼",
                  translation: "Wing",
                  audioPath: "/audio/foundations/M1L4_yi4.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Your pitch should fall sharply.",
                      incorrectPronunciation: "Ensure your tone falls quickly and decisively."
                  ),
                  transcriptionCheck: Formants(F1: 252.3, F2: 2405.6),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [158.7, 158.7, 161.0, 164.5, 170.1, 170.8, 170.5, 168.5, 161.4, 160.5, 159.4, 155.3, 145.9, 142.2, 138.7, 135.5, 125.6, 121.2, 117.5, 114.8],
                  userPitchVectors: []
              ),
              Word(
                  id: "word4",
                  pinyin: "dì",
                  word: "弟",
                  translation: "Little Brother",
                  audioPath: "/audio/foundations/M1L4_di4.wav",
                  starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
                  feedback: Feedback(
                      incorrectPitch: "Your pitch should fall sharply.",
                      incorrectPronunciation: "Ensure your tone falls quickly and decisively."
                  ),
                  transcriptionCheck: Formants(F1: 264.7, F2: 2370.0),
                  voiceProcessingCheck: nil,
                  starValue: 5,
                  replayAllowed: true,
                  samplePitchVectors: [169.8, 170.7, 172.0, 172.7, 173.3, 172.9, 168.0, 164.3, 161.2, 156.9, 151.8, 147.5, 140.9, 135.9, 132.7, 129.6, 126.0, 121.5, 117.3, 114.9],
                  userPitchVectors: []
              )
          ]
        )
      ]
    )
  
  // Module: Airport
  let airportModule = Module(
    id: "airportModule",
    title: "Cruising through the Airport",
    starsRequired: 50,
    isUnlocked: false,
    totalStarsAvailable: 75,
    lessons: [
      Lesson(
        id: "lesson1",
        title: "Introduction to Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Complex vowels in Mandarin combine two vowel sounds and often require smooth transitions between them. The vowels 'ai' (as in 爱, ài - love) and 'ei' (as in 北, běi - north) are diphthongs, meaning the tongue moves from one position to another within the same syllable.",
          "The key to pronouncing these diphthongs correctly is to maintain the tone throughout. For example, in 'ai,' the sound begins with 'a' and glides into 'i.' Practice with words like “海” (hǎi - sea) to ensure your tone remains steady. Similarly, 'ao' and 'ou' involve gliding from 'a' to 'o' or 'o' to 'u.' These sounds appear often in airport-related vocabulary."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "ài",
              word: "爱",
              translation: "love",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "běi",
              word: "北",
              translation: "north",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "hǎi",
              word: "海",
              translation: "sea",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "bāo",
              word: "包",
              translation: "bag",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "kǒu",
              word: "口",
              translation: "mouth/gate",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
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
        title: "Advanced Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "This lesson introduces diphthongs that include 'i' or 'u' as initial sounds. For example, 'ia' (as in 家, jiā - home) starts with 'i' and glides into 'a.' Words like '夜' (yè - night) and '油' (yóu - oil) use similar transitions with 'ie' and 'iu.'",
          "For ua' and 'uo,' the initial 'u' sound is rounded and distinct. Words like '花' (huā - flower) and '国' (guó - country) demonstrate how to move seamlessly from 'u' to the following vowel. Remember to emphasize tone while practicing these sounds, as the tone must remain clear even during the transition."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      ),
      Lesson(
        id: "lesson3",
        title: "Complex Finals with Nasals",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Mandarin complex vowels often combine with nasal endings like 'n' or 'ng.' For example, 'ian' (as in 电, diàn - electricity) and 'iang' (as in 强, qiáng - strong) require careful nasalization at the end of the syllable. The tongue should briefly touch the roof of the mouth for 'n' or glide towards the back for 'ng.'",
          "Similarly, 'uan' (as in 管, guǎn - to manage) and 'uang' (as in 光, guāng - light) combine the rounded 'u' with nasal finals. Words like these are common in travel-related contexts, such as asking about electricity or managing luggage. Practice with clear transitions and consistent tone."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      )
      
    ]
  )
  
  // Module: Cafe
  let cafeModule = Module(
    id: "cafeModule",
    title: "At a Café",
    starsRequired: 50,
    isUnlocked: false,
    totalStarsAvailable: 75,
    lessons: [
      Lesson(
        id: "lesson1",
        title: "Introduction to Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Complex vowels in Mandarin combine two vowel sounds and often require smooth transitions between them. The vowels 'ai' (as in 爱, ài - love) and 'ei' (as in 北, běi - north) are diphthongs, meaning the tongue moves from one position to another within the same syllable.",
          "The key to pronouncing these diphthongs correctly is to maintain the tone throughout. For example, in 'ai,' the sound begins with 'a' and glides into 'i.' Practice with words like “海” (hǎi - sea) to ensure your tone remains steady. Similarly, 'ao' and 'ou' involve gliding from 'a' to 'o' or 'o' to 'u.' These sounds appear often in airport-related vocabulary."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "ài",
              word: "爱",
              translation: "love",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "běi",
              word: "北",
              translation: "north",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "hǎi",
              word: "海",
              translation: "sea",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "bāo",
              word: "包",
              translation: "bag",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "kǒu",
              word: "口",
              translation: "mouth/gate",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
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
        title: "Advanced Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "This lesson introduces diphthongs that include 'i' or 'u' as initial sounds. For example, 'ia' (as in 家, jiā - home) starts with 'i' and glides into 'a.' Words like '夜' (yè - night) and '油' (yóu - oil) use similar transitions with 'ie' and 'iu.'",
          "For ua' and 'uo,' the initial 'u' sound is rounded and distinct. Words like '花' (huā - flower) and '国' (guó - country) demonstrate how to move seamlessly from 'u' to the following vowel. Remember to emphasize tone while practicing these sounds, as the tone must remain clear even during the transition."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      ),
      Lesson(
        id: "lesson3",
        title: "Complex Finals with Nasals",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Mandarin complex vowels often combine with nasal endings like 'n' or 'ng.' For example, 'ian' (as in 电, diàn - electricity) and 'iang' (as in 强, qiáng - strong) require careful nasalization at the end of the syllable. The tongue should briefly touch the roof of the mouth for 'n' or glide towards the back for 'ng.'",
          "Similarly, 'uan' (as in 管, guǎn - to manage) and 'uang' (as in 光, guāng - light) combine the rounded 'u' with nasal finals. Words like these are common in travel-related contexts, such as asking about electricity or managing luggage. Practice with clear transitions and consistent tone."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      )
      
    ]
  )
  
  // Module: Beach
  let beachModule = Module(
    id: "beachModule",
    title: "A Day at the Beach",
    starsRequired: 50,
    isUnlocked: false,
    totalStarsAvailable: 75,
    lessons: [
      Lesson(
        id: "lesson1",
        title: "Introduction to Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Complex vowels in Mandarin combine two vowel sounds and often require smooth transitions between them. The vowels 'ai' (as in 爱, ài - love) and 'ei' (as in 北, běi - north) are diphthongs, meaning the tongue moves from one position to another within the same syllable.",
          "The key to pronouncing these diphthongs correctly is to maintain the tone throughout. For example, in 'ai,' the sound begins with 'a' and glides into 'i.' Practice with words like “海” (hǎi - sea) to ensure your tone remains steady. Similarly, 'ao' and 'ou' involve gliding from 'a' to 'o' or 'o' to 'u.' These sounds appear often in airport-related vocabulary."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "ài",
              word: "爱",
              translation: "love",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "běi",
              word: "北",
              translation: "north",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "hǎi",
              word: "海",
              translation: "sea",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "bāo",
              word: "包",
              translation: "bag",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "kǒu",
              word: "口",
              translation: "mouth/gate",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
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
        title: "Advanced Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "This lesson introduces diphthongs that include 'i' or 'u' as initial sounds. For example, 'ia' (as in 家, jiā - home) starts with 'i' and glides into 'a.' Words like '夜' (yè - night) and '油' (yóu - oil) use similar transitions with 'ie' and 'iu.'",
          "For ua' and 'uo,' the initial 'u' sound is rounded and distinct. Words like '花' (huā - flower) and '国' (guó - country) demonstrate how to move seamlessly from 'u' to the following vowel. Remember to emphasize tone while practicing these sounds, as the tone must remain clear even during the transition."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      ),
      Lesson(
        id: "lesson3",
        title: "Complex Finals with Nasals",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Mandarin complex vowels often combine with nasal endings like 'n' or 'ng.' For example, 'ian' (as in 电, diàn - electricity) and 'iang' (as in 强, qiáng - strong) require careful nasalization at the end of the syllable. The tongue should briefly touch the roof of the mouth for 'n' or glide towards the back for 'ng.'",
          "Similarly, 'uan' (as in 管, guǎn - to manage) and 'uang' (as in 光, guāng - light) combine the rounded 'u' with nasal finals. Words like these are common in travel-related contexts, such as asking about electricity or managing luggage. Practice with clear transitions and consistent tone."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      )
      
    ]
  )
  
  // Module: Camping
  let campingModule = Module(
    id: "campingModule",
    title: "Going Camping",
    starsRequired: 50,
    isUnlocked: false,
    totalStarsAvailable: 75,
    lessons: [
      Lesson(
        id: "lesson1",
        title: "Introduction to Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Complex vowels in Mandarin combine two vowel sounds and often require smooth transitions between them. The vowels 'ai' (as in 爱, ài - love) and 'ei' (as in 北, běi - north) are diphthongs, meaning the tongue moves from one position to another within the same syllable.",
          "The key to pronouncing these diphthongs correctly is to maintain the tone throughout. For example, in 'ai,' the sound begins with 'a' and glides into 'i.' Practice with words like “海” (hǎi - sea) to ensure your tone remains steady. Similarly, 'ao' and 'ou' involve gliding from 'a' to 'o' or 'o' to 'u.' These sounds appear often in airport-related vocabulary."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "ài",
              word: "爱",
              translation: "love",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "běi",
              word: "北",
              translation: "north",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "hǎi",
              word: "海",
              translation: "sea",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "bāo",
              word: "包",
              translation: "bag",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "kǒu",
              word: "口",
              translation: "mouth/gate",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
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
        title: "Advanced Complex Vowels",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "This lesson introduces diphthongs that include 'i' or 'u' as initial sounds. For example, 'ia' (as in 家, jiā - home) starts with 'i' and glides into 'a.' Words like '夜' (yè - night) and '油' (yóu - oil) use similar transitions with 'ie' and 'iu.'",
          "For ua' and 'uo,' the initial 'u' sound is rounded and distinct. Words like '花' (huā - flower) and '国' (guó - country) demonstrate how to move seamlessly from 'u' to the following vowel. Remember to emphasize tone while practicing these sounds, as the tone must remain clear even during the transition."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      ),
      Lesson(
        id: "lesson3",
        title: "Complex Finals with Nasals",
        lessonOrder: 1,
        totalStarsAvailable: 25,
        content: [
          "Mandarin complex vowels often combine with nasal endings like 'n' or 'ng.' For example, 'ian' (as in 电, diàn - electricity) and 'iang' (as in 强, qiáng - strong) require careful nasalization at the end of the syllable. The tongue should briefly touch the roof of the mouth for 'n' or glide towards the back for 'ng.'",
          "Similarly, 'uan' (as in 管, guǎn - to manage) and 'uang' (as in 光, guāng - light) combine the rounded 'u' with nasal finals. Words like these are common in travel-related contexts, such as asking about electricity or managing luggage. Practice with clear transitions and consistent tone."
        ],
        words: [
          Word(
              id: "word1",
              pinyin: "jiā",
              word: "家",
              translation: "home",
              audioPath: "/audio/foundations/M2L1_ai4.wav",
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
              pinyin: "yè",
              word: "夜",
              translation: "night",
              audioPath: "/audio/foundations/M2L1_bei3.wav",
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
              pinyin: "yóu",
              word: "油",
              translation: "oil",
              audioPath: "/audio/foundations/M2L1_hai3.wav",
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
              pinyin: "huā",
              word: "花",
              translation: "flower",
              audioPath: "/audio/foundations/M2L1_bao1.wav",
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
              pinyin: "guó",
              word: "国",
              translation: "country",
              audioPath: "/audio/foundations/M2L1_kou3.wav",
              starsForAccuracy: ["90-100": 5, "80-89": 4, "70-79": 3],
              feedback: Feedback(
                  incorrectPitch: "Keep your pitch level and even.",
                  incorrectPronunciation: "Ensure you’re using a flat tone without inflection."
              ),
              transcriptionCheck: Formants(F1: 250, F2: 2500),
              voiceProcessingCheck: nil,
              starValue: 5,
              replayAllowed: true,
              samplePitchVectors: [135.8, 145.4, 146.5, 147.7, 149.4, 150.9, 151.5, 150.3, 151.1, 151.3, 150.9, 151.5, 152.9, 152.6, 153.0, 152.9, 152.7, 150.4, 153.1, 149.2],
              userPitchVectors: []
          )
        ]
      )
      
    ]
  )
  
  // Upload Modules to Firestore
  let modules = [foundationsModule, airportModule, cafeModule, beachModule, campingModule]
  
  for module in modules {
    guard let moduleId = module.id else {
      print("Error: Module \(module.title) has a nil id and cannot be uploaded.")
      continue
    }
    let moduleData = try Firestore.Encoder().encode(module)
    try await db.collection("Modules").document(moduleId).setData(moduleData)
    print("Module \(module.title) uploaded successfully.")
  }
  
  
  func createBadges() async throws {
    let db = Firestore.firestore()
    
    let badges = [
      Badge(
        id: "foundations-complete",
        title: "Foundations Master",
        description: "Completed all lessons in the Foundations Island module.",
        icon: "foundations-complete-icon",
        dateReceived: nil
      ),
      Badge(
        id: "baby-steps",
        title: "Baby Steps",
        description: "Completed your first lesson.",
        icon: "baby-steps-icon",
        dateReceived: nil
      ),
      Badge(
        id: "airport-navigator",
        title: "Airport Navigator",
        description: "Completed the Airports module.",
        icon: "airport-navigator-icon",
        dateReceived: nil
      ),
      Badge(
        id: "cafe-lover",
        title: "Cafe Lover",
        description: "Completed the Cafe module.",
        icon: "cafe-lover-icon",
        dateReceived: nil
      ),
      Badge(
        id: "language-explorer",
        title: "Language Explorer",
        description: "Completed a total of 10 lessons.",
        icon: "language-explorer-icon",
        dateReceived: nil
      )
    ]
    
    for badge in badges {
      let badgeRef = db.collection("Badges").document(badge.id)
      do {
        try badgeRef.setData(from: badge)
        print("Badge \(badge.title) added successfully!")
      } catch {
        print("Error adding badge \(badge.title): \(error.localizedDescription)")
      }
    }
  }
  
  
}
