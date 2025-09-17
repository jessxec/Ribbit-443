import React from 'react';

const HeroSection = ({ darkMode }) => {

  return (
    <section className={`relative min-h-screen flex items-center justify-center overflow-hidden pond-waves ${
      darkMode ? 'bg-gray-900' : 'bg-ribbit-gradient'
    }`}>
      {/* Pond-themed background elements */}
      <div className="absolute inset-0 overflow-hidden">
        {/* Lily pads floating */}
        <div className="absolute top-20 left-10 w-20 h-20 bg-ribbit-pale-green rounded-full opacity-30 lily-pad-float interactive-lily" 
             style={{ clipPath: 'polygon(50% 0%, 0% 100%, 100% 100%)' }}>
          <div className="absolute top-2 left-1/2 transform -translate-x-1/2 w-2 h-2 bg-ribbit-dark-teal rounded-full"></div>
        </div>
        
        {/* Dragonfly buzzing around */}
        <div className="absolute top-40 right-20 w-8 h-8 fly-buzz">
          <img src="/images/features/dragonfly.png" alt="Dragonfly" className="w-full h-full object-contain" />
        </div>
        
        {/* Shell on the pond floor */}
        <div className="absolute bottom-40 left-20 w-16 h-16 bubble-rise">
          <img src="/images/features/shell.png" alt="Shell" className="w-full h-full object-contain" />
        </div>
        

        {/* Ripple effects */}
        <div className="absolute top-1/2 left-1/4 w-4 h-4 bg-ribbit-light-teal/20 rounded-full ripple-effect"></div>
        <div className="absolute top-1/3 right-1/3 w-6 h-6 bg-ribbit-pale-green/20 rounded-full ripple-effect" style={{ animationDelay: '1s' }}></div>
        <div className="absolute bottom-1/3 left-1/2 w-3 h-3 bg-ribbit-dark-teal/20 rounded-full ripple-effect" style={{ animationDelay: '2s' }}></div>

        {/* Floating bubbles */}
        <div className="absolute top-1/4 left-1/6 w-2 h-2 bg-ribbit-off-white/30 rounded-full bubble-rise"></div>
        <div className="absolute top-1/2 right-1/4 w-3 h-3 bg-ribbit-light-teal/40 rounded-full bubble-rise" style={{ animationDelay: '1.5s' }}></div>
        <div className="absolute bottom-1/4 right-1/6 w-2 h-2 bg-ribbit-pale-green/30 rounded-full bubble-rise" style={{ animationDelay: '3s' }}></div>
      </div>


      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid lg:grid-cols-2 gap-12 items-center">
          {/* Left side - Content */}
          <div className="hero-fade-in">
            <div className="space-y-8">
              {/* Badge */}
              <div className="inline-flex items-center px-4 py-2 rounded-full bg-ribbit-light-teal/20 border border-ribbit-light-teal/30">
                <span className={`text-sm font-medium ${
                  darkMode ? 'text-ribbit-light-teal' : 'text-ribbit-dark'
                }`}>
                  🎉 Now available on iOS
                </span>
              </div>

              {/* Main heading */}
              <h1 className={`text-5xl lg:text-7xl font-bold leading-tight ${
                darkMode ? 'text-white' : 'text-ribbit-dark'
              }`}>
                Master Chinese with{' '}
                <span className="gradient-text ribbit-bounce">Ribbit</span>
              </h1>

              {/* Subheading */}
              <p className={`text-xl lg:text-2xl leading-relaxed ${
                darkMode ? 'text-gray-300' : 'text-ribbit-dark/80'
              }`}>
                Gamified language learning that makes mastering tones, vocabulary, and pronunciation fun and engaging. 
                Join thousands of learners on their journey to fluency.
              </p>

              {/* CTA Buttons */}
              <div className="flex flex-col sm:flex-row gap-4">
                <a
                  href="#download"
                  className="btn-primary text-center inline-flex items-center justify-center"
                >
                  <svg className="w-6 h-6 mr-2" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/>
                  </svg>
                  Download on App Store
                </a>
                
                <a
                  href="#features"
                  className="btn-secondary text-center inline-flex items-center justify-center"
                >
                  Learn More
                  <svg className="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                  </svg>
                </a>
              </div>

              {/* Stats */}
              <div className="flex flex-wrap gap-8 pt-8">
                <div className="text-center">
                  <div className={`text-3xl font-bold ${
                    darkMode ? 'text-white' : 'text-ribbit-dark'
                  }`}>
                    10K+
                  </div>
                  <div className={`text-sm ${
                    darkMode ? 'text-gray-400' : 'text-ribbit-dark/60'
                  }`}>
                    Active Learners
                  </div>
                </div>
                <div className="text-center">
                  <div className={`text-3xl font-bold ${
                    darkMode ? 'text-white' : 'text-ribbit-dark'
                  }`}>
                    4.8★
                  </div>
                  <div className={`text-sm ${
                    darkMode ? 'text-gray-400' : 'text-ribbit-dark/60'
                  }`}>
                    App Store Rating
                  </div>
                </div>
                <div className="text-center">
                  <div className={`text-3xl font-bold ${
                    darkMode ? 'text-white' : 'text-ribbit-dark'
                  }`}>
                    5
                  </div>
                  <div className={`text-sm ${
                    darkMode ? 'text-gray-400' : 'text-ribbit-dark/60'
                  }`}>
                    Learning Modules
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Right side - App Mockup */}
          <div className="hero-fade-in lg:order-last order-first">
            <div className="relative">
              {/* Phone mockup container */}
              <div className="relative mx-auto w-80 h-[600px] bg-ribbit-dark rounded-[3rem] p-2 shadow-2xl">
                <div className="w-full h-full bg-ribbit-background rounded-[2.5rem] overflow-hidden relative">
                  {/* Mockup content - pond-themed app interface */}
                  <div className="absolute inset-0 bg-gradient-to-b from-ribbit-light-teal/20 to-ribbit-pale-green/20">
                    {/* Pond-themed app interface */}
                    <div className="flex items-center justify-center h-full relative">
                      {/* Pond background */}
                      <div className="absolute inset-0 bg-gradient-to-b from-ribbit-light-teal/10 to-ribbit-pale-green/10"></div>
                      
                      {/* App content */}
                      <div className="text-center space-y-4 relative z-10">
                        <img 
                          src="/images/icons/app-icon.png" 
                          alt="Ribbit App Icon" 
                          className="w-20 h-20 rounded-2xl mx-auto ribbit-bounce"
                        />
                        <div className="space-y-2">
                          <div className="h-4 bg-ribbit-dark/20 rounded w-32 mx-auto"></div>
                          <div className="h-3 bg-ribbit-dark/10 rounded w-24 mx-auto"></div>
                        </div>
                        
                        {/* Module icons as lily pads */}
                        <div className="flex justify-center space-x-2">
                          <div className="w-12 h-12 bg-ribbit-light-teal rounded-xl lily-pad-float flex items-center justify-center">
                            <span className="text-xs">🏝️</span>
                          </div>
                          <div className="w-12 h-12 bg-ribbit-pale-green rounded-xl lily-pad-float flex items-center justify-center" style={{ animationDelay: '0.5s' }}>
                            <span className="text-xs">✈️</span>
                          </div>
                          <div className="w-12 h-12 bg-ribbit-dark-teal rounded-xl lily-pad-float flex items-center justify-center" style={{ animationDelay: '1s' }}>
                            <span className="text-xs">☕</span>
                          </div>
                        </div>
                      </div>

                      {/* Floating elements in the phone */}
                      <div className="absolute top-8 left-8 w-4 h-4 bg-ribbit-pale-green/30 rounded-full bubble-rise"></div>
                      <div className="absolute top-16 right-12 w-3 h-3 bg-ribbit-light-teal/40 rounded-full bubble-rise" style={{ animationDelay: '1s' }}></div>
                      <div className="absolute bottom-20 left-12 w-5 h-5 bg-ribbit-dark-teal/30 rounded-full bubble-rise" style={{ animationDelay: '2s' }}></div>
                    </div>
                  </div>
                </div>
              </div>

              {/* Floating decorative elements around phone */}
              <div className="absolute -top-4 -right-4 w-8 h-8 bg-ribbit-pale-green rounded-full floating interactive-lily" 
                   style={{ clipPath: 'polygon(50% 0%, 0% 100%, 100% 100%)' }}>
                <div className="absolute top-1 left-1/2 transform -translate-x-1/2 w-1 h-1 bg-ribbit-dark-teal rounded-full"></div>
              </div>
              <div className="absolute -bottom-4 -left-4 w-6 h-6 bg-ribbit-light-teal rounded-full floating-delayed"></div>
              <div className="absolute top-1/2 -left-8 w-4 h-4 bg-ribbit-dark-teal rounded-full floating">
                <img src="/images/features/dragonfly.png" alt="Dragonfly" className="w-full h-full object-contain" />
              </div>
              
              {/* Additional pond elements */}
              <div className="absolute -top-8 left-1/2 transform -translate-x-1/2 w-3 h-3 bg-ribbit-off-white/40 rounded-full bubble-rise"></div>
              <div className="absolute -bottom-8 right-1/4 w-2 h-2 bg-ribbit-pale-green/50 rounded-full bubble-rise" style={{ animationDelay: '1.5s' }}></div>
            </div>
          </div>
        </div>
      </div>

      {/* Scroll indicator with frog */}
      <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2">
        <div className="text-center">
          <div className={`w-6 h-10 border-2 rounded-full flex justify-center mb-2 ${
            darkMode ? 'border-gray-400' : 'border-ribbit-dark/30'
          }`}>
            <div className={`w-1 h-3 rounded-full mt-2 animate-bounce ${
              darkMode ? 'bg-gray-400' : 'bg-ribbit-dark/50'
            }`}></div>
          </div>
          <div className="text-xs text-ribbit-dark/60 font-medium">
            Scroll to explore the pond
          </div>
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
