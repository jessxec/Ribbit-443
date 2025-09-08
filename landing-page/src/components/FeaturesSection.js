import React from 'react';

const FeaturesSection = ({ darkMode }) => {
  const features = [
    {
      icon: '/images/features/gamified-learning.png',
      title: 'Gamified Learning',
      description: 'Master Chinese through interactive games, challenges, and achievements. Each lesson feels like an adventure, not a chore.',
      details: 'Navigate through themed modules like Foundations Island, Airport, Cafe, Beach, and Camping. Each location offers unique vocabulary and cultural insights with engaging visual elements.',
      color: 'ribbit-light-teal'
    },
    {
      icon: '/images/features/tone-visualization.png',
      title: 'Tone Visualization',
      description: 'See and hear Chinese tones like never before. Our innovative tone visualization helps you master pronunciation with confidence.',
      details: 'Real-time pitch tracking with animated graphs, star-based feedback system, and visual tone patterns. Watch your pronunciation improve with immediate visual feedback and sprite animations.',
      color: 'ribbit-pale-green'
    },
    {
      icon: '/images/features/achievement-system.png',
      title: 'Achievement System',
      description: 'Unlock badges and track your progress as you journey through different themed modules - from airports to beaches.',
      details: 'Earn badges for completing lessons, mastering tones, and achieving milestones. Track your progress with detailed statistics and celebrate your learning journey.',
      color: 'ribbit-dark-teal'
    },
    {
      icon: '/images/features/voice-feedback.png',
      title: 'Personalized Feedback',
      description: 'Get instant feedback on your pronunciation with our advanced voice recognition technology that adapts to your learning pace.',
      details: 'Advanced voice calibration system that adapts to your pitch range. Real-time feedback with color-coded borders (green for perfect, yellow for good, red for needs improvement).',
      color: 'ribbit-pale-teal'
    }
  ];

  return (
    <section id="features" className={`py-20 ${darkMode ? 'bg-gray-800' : 'bg-ribbit-off-white'}`}>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section header */}
        <div className="text-center mb-16">
          <h2 className={`text-4xl lg:text-5xl font-bold mb-6 ${
            darkMode ? 'text-white' : 'text-ribbit-dark'
          }`}>
            Why Choose <span className="gradient-text">Ribbit</span>?
          </h2>
          <p className={`text-xl max-w-3xl mx-auto ${
            darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
          }`}>
            Experience language learning reimagined with cutting-edge features designed to make Chinese accessible, 
            engaging, and effective for learners of all levels.
          </p>
        </div>

        {/* Features grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          {features.map((feature, index) => (
            <div
              key={index}
              className={`feature-card ${darkMode ? 'dark' : ''} group`}
              style={{ animationDelay: `${index * 0.1}s` }}
            >
              {/* Feature icon */}
              <div className={`w-20 h-20 bg-${feature.color} rounded-2xl flex items-center justify-center mb-6 feature-icon transition-transform duration-300 overflow-hidden`}>
                <img 
                  src={feature.icon} 
                  alt={feature.title}
                  className="w-12 h-12 object-contain"
                />
              </div>

              {/* Feature content */}
              <h3 className={`text-xl font-bold mb-4 ${
                darkMode ? 'text-white' : 'text-ribbit-dark'
              }`}>
                {feature.title}
              </h3>
              
              <p className={`leading-relaxed mb-4 ${
                darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
              }`}>
                {feature.description}
              </p>

              {/* Detailed description */}
              <p className={`text-sm leading-relaxed ${
                darkMode ? 'text-gray-400' : 'text-ribbit-dark/60'
              }`}>
                {feature.details}
              </p>

              {/* Decorative element */}
              <div className={`mt-6 w-12 h-1 bg-${feature.color} rounded-full opacity-60`}></div>
            </div>
          ))}
        </div>

        {/* Additional feature showcase */}
        <div className={`mt-20 rounded-3xl p-8 lg:p-12 ${
          darkMode ? 'bg-gray-700' : 'bg-ribbit-background'
        }`}>
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            {/* Left side - Content */}
            <div>
              <h3 className={`text-3xl lg:text-4xl font-bold mb-6 ${
                darkMode ? 'text-white' : 'text-ribbit-dark'
              }`}>
                Themed Learning Adventures
              </h3>
              
              <p className={`text-lg mb-8 ${
                darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
              }`}>
                Journey through immersive themed modules that take you from the airport to the beach, 
                from cafes to camping sites. Each location offers unique vocabulary and cultural insights.
              </p>

              {/* Module list */}
              <div className="space-y-4">
                {[
                  { name: 'Foundations Island', icon: '🏝️', description: 'Master the basics' },
                  { name: 'Airport Module', icon: '✈️', description: 'Travel vocabulary' },
                  { name: 'Cafe Module', icon: '☕', description: 'Food & dining' },
                  { name: 'Beach Module', icon: '🏖️', description: 'Leisure activities' },
                  { name: 'Camping Module', icon: '⛺', description: 'Outdoor adventures' }
                ].map((module, index) => (
                  <div key={index} className="flex items-center space-x-4">
                    <div className="w-10 h-10 bg-ribbit-light-teal rounded-lg flex items-center justify-center">
                      <span className="text-lg">{module.icon}</span>
                    </div>
                    <div>
                      <div className={`font-semibold ${
                        darkMode ? 'text-white' : 'text-ribbit-dark'
                      }`}>
                        {module.name}
                      </div>
                      <div className={`text-sm ${
                        darkMode ? 'text-gray-400' : 'text-ribbit-dark/60'
                      }`}>
                        {module.description}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Right side - Visual */}
            <div className="relative">
              {/* Interactive Learning Map Preview */}
              <div className="w-full h-96 rounded-2xl overflow-hidden shadow-2xl">
                <img 
                  src="/images/features/gamified-learning.png" 
                  alt="Interactive Learning Map showing themed modules"
                  className="w-full h-full object-cover"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent"></div>
                <div className="absolute bottom-4 left-4 right-4">
                  <div className="text-white">
                    <div className="text-lg font-semibold mb-2">
                      Interactive Learning Map
                    </div>
                    <div className="text-sm opacity-90">
                      Navigate through themed modules with engaging visual elements
                    </div>
                  </div>
                </div>
              </div>

              {/* Floating decorative elements */}
              <div className="absolute -top-4 -right-4 w-8 h-8 bg-ribbit-pale-green rounded-full floating"></div>
              <div className="absolute -bottom-4 -left-4 w-6 h-6 bg-ribbit-dark-teal rounded-full floating-delayed"></div>
            </div>
          </div>
        </div>

        {/* Detailed Feature Showcase */}
        <div className="mt-20">
          <h3 className={`text-3xl font-bold text-center mb-12 ${
            darkMode ? 'text-white' : 'text-ribbit-dark'
          }`}>
            See Ribbit in Action
          </h3>
          
          <div className="space-y-16">
            {/* Tone Visualization Feature */}
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div className="order-2 lg:order-1">
                <div className={`w-full h-80 rounded-2xl ${
                  darkMode ? 'bg-gray-700' : 'bg-ribbit-light-teal/20'
                } flex items-center justify-center relative overflow-hidden`}>
                  {/* Mockup of tone visualization */}
                  <div className="text-center space-y-4">
                    <div className="w-32 h-32 bg-ribbit-dark rounded-2xl mx-auto flex items-center justify-center">
                      <img 
                        src="/images/features/tone-visualization.png" 
                        alt="Tone Visualization"
                        className="w-16 h-16"
                      />
                    </div>
                    <div className="space-y-2">
                      <div className="h-2 bg-ribbit-dark/20 rounded w-24 mx-auto"></div>
                      <div className="h-2 bg-ribbit-dark/10 rounded w-20 mx-auto"></div>
                      <div className="h-2 bg-ribbit-dark/20 rounded w-28 mx-auto"></div>
                    </div>
                    <div className="flex justify-center space-x-1">
                      <div className="w-4 h-4 bg-yellow-400 rounded-full"></div>
                      <div className="w-4 h-4 bg-yellow-400 rounded-full"></div>
                      <div className="w-4 h-4 bg-yellow-400 rounded-full"></div>
                      <div className="w-4 h-4 bg-gray-300 rounded-full"></div>
                      <div className="w-4 h-4 bg-gray-300 rounded-full"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="order-1 lg:order-2">
                <h4 className={`text-2xl font-bold mb-4 ${
                  darkMode ? 'text-white' : 'text-ribbit-dark'
                }`}>
                  Real-Time Tone Visualization
                </h4>
                <p className={`text-lg mb-6 ${
                  darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
                }`}>
                  Watch your pronunciation improve with our innovative tone visualization system. 
                  See real-time pitch tracking, animated graphs, and get instant feedback with 
                  our star-based rating system.
                </p>
                <ul className={`space-y-2 ${
                  darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
                }`}>
                  <li className="flex items-center">
                    <div className="w-2 h-2 bg-ribbit-pale-green rounded-full mr-3"></div>
                    Animated pitch graphs with sprite characters
                  </li>
                  <li className="flex items-center">
                    <div className="w-2 h-2 bg-ribbit-pale-green rounded-full mr-3"></div>
                    Color-coded feedback (green/yellow/red borders)
                  </li>
                  <li className="flex items-center">
                    <div className="w-2 h-2 bg-ribbit-pale-green rounded-full mr-3"></div>
                    Star-based accuracy rating system
                  </li>
                </ul>
              </div>
            </div>

            {/* Voice Feedback Feature */}
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div>
                <h4 className={`text-2xl font-bold mb-4 ${
                  darkMode ? 'text-white' : 'text-ribbit-dark'
                }`}>
                  Advanced Voice Calibration
                </h4>
                <p className={`text-lg mb-6 ${
                  darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
                }`}>
                  Our voice calibration system adapts to your unique pitch range, providing 
                  personalized feedback that helps you master Chinese pronunciation at your own pace.
                </p>
                <ul className={`space-y-2 ${
                  darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
                }`}>
                  <li className="flex items-center">
                    <div className="w-2 h-2 bg-ribbit-dark-teal rounded-full mr-3"></div>
                    Personalized pitch range detection
                  </li>
                  <li className="flex items-center">
                    <div className="w-2 h-2 bg-ribbit-dark-teal rounded-full mr-3"></div>
                    Real-time voice analysis and feedback
                  </li>
                  <li className="flex items-center">
                    <div className="w-2 h-2 bg-ribbit-dark-teal rounded-full mr-3"></div>
                    Adaptive learning algorithms
                  </li>
                </ul>
              </div>
              <div>
                <div className={`w-full h-80 rounded-2xl ${
                  darkMode ? 'bg-gray-700' : 'bg-ribbit-pale-teal/20'
                } flex items-center justify-center relative overflow-hidden`}>
                  <div className="text-center space-y-4">
                    <div className="w-32 h-32 bg-ribbit-dark rounded-2xl mx-auto flex items-center justify-center">
                      <img 
                        src="/images/features/voice-feedback.png" 
                        alt="Voice Feedback"
                        className="w-16 h-16"
                      />
                    </div>
                    <div className="space-y-2">
                      <div className="h-3 bg-green-500 rounded w-32 mx-auto"></div>
                      <div className="h-3 bg-yellow-500 rounded w-24 mx-auto"></div>
                      <div className="h-3 bg-red-500 rounded w-20 mx-auto"></div>
                    </div>
                    <div className="text-sm text-ribbit-dark/60">
                      Voice Calibration Complete
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default FeaturesSection;
