import React from 'react';

const TestimonialsSection = ({ darkMode }) => {
  const testimonials = [
    {
      name: 'Sarah Chen',
      role: 'Business Professional',
      avatar: '👩‍💼',
      content: 'Ribbit made learning Chinese tones actually fun! The visual feedback helped me understand pronunciation in ways traditional methods never could.',
      rating: 5
    },
    {
      name: 'Marcus Johnson',
      role: 'University Student',
      avatar: '👨‍🎓',
      content: 'The gamified approach kept me engaged for months. I went from zero Chinese knowledge to having conversations with native speakers.',
      rating: 5
    },
    {
      name: 'Emily Rodriguez',
      role: 'Travel Enthusiast',
      avatar: '👩‍✈️',
      content: 'Perfect for preparing for my trip to China! The themed modules like Airport and Cafe were incredibly practical and useful.',
      rating: 5
    }
  ];

  const communityStats = [
    { number: '10,000+', label: 'Active Learners' },
    { number: '50,000+', label: 'Lessons Completed' },
    { number: '4.8/5', label: 'Average Rating' },
    { number: '95%', label: 'Would Recommend' }
  ];

  return (
    <section id="testimonials" className={`py-20 ${darkMode ? 'bg-gray-900' : 'bg-ribbit-background'}`}>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section header */}
        <div className="text-center mb-16">
          <h2 className={`text-4xl lg:text-5xl font-bold mb-6 ${
            darkMode ? 'text-white' : 'text-ribbit-dark'
          }`}>
            Loved by Learners Worldwide
          </h2>
          <p className={`text-xl max-w-3xl mx-auto ${
            darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
          }`}>
            Join thousands of successful learners who have transformed their Chinese language skills with Ribbit.
          </p>
        </div>

        {/* Community stats */}
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-8 mb-16">
          {communityStats.map((stat, index) => (
            <div key={index} className="text-center">
              <div className={`text-4xl lg:text-5xl font-bold mb-2 gradient-text`}>
                {stat.number}
              </div>
              <div className={`text-sm font-medium ${
                darkMode ? 'text-gray-400' : 'text-ribbit-dark/60'
              }`}>
                {stat.label}
              </div>
            </div>
          ))}
        </div>

        {/* Testimonials grid */}
        <div className="grid md:grid-cols-3 gap-8 mb-16">
          {testimonials.map((testimonial, index) => (
            <div
              key={index}
              className={`testimonial-card rounded-2xl p-8 ${
                darkMode ? 'dark' : ''
              }`}
              style={{ animationDelay: `${index * 0.2}s` }}
            >
              {/* Rating stars */}
              <div className="flex mb-4">
                {[...Array(testimonial.rating)].map((_, i) => (
                  <svg
                    key={i}
                    className="w-5 h-5 text-yellow-400"
                    fill="currentColor"
                    viewBox="0 0 20 20"
                  >
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                ))}
              </div>

              {/* Testimonial content */}
              <blockquote className={`text-lg mb-6 ${
                darkMode ? 'text-gray-300' : 'text-ribbit-dark/80'
              }`}>
                "{testimonial.content}"
              </blockquote>

              {/* Author info */}
              <div className="flex items-center">
                <div className="w-12 h-12 bg-ribbit-light-teal rounded-full flex items-center justify-center mr-4">
                  <span className="text-xl">{testimonial.avatar}</span>
                </div>
                <div>
                  <div className={`font-semibold ${
                    darkMode ? 'text-white' : 'text-ribbit-dark'
                  }`}>
                    {testimonial.name}
                  </div>
                  <div className={`text-sm ${
                    darkMode ? 'text-gray-400' : 'text-ribbit-dark/60'
                  }`}>
                    {testimonial.role}
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* App Store reviews section */}
        <div className={`rounded-3xl p-8 lg:p-12 text-center ${
          darkMode ? 'bg-gray-800' : 'bg-ribbit-off-white'
        }`}>
          <h3 className={`text-3xl font-bold mb-6 ${
            darkMode ? 'text-white' : 'text-ribbit-dark'
          }`}>
            Trusted by the App Store Community
          </h3>
          
          <div className="flex justify-center items-center mb-8">
            <div className="flex items-center space-x-2">
              {[...Array(5)].map((_, i) => (
                <svg
                  key={i}
                  className="w-8 h-8 text-yellow-400"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                </svg>
              ))}
              <span className={`text-2xl font-bold ml-2 ${
                darkMode ? 'text-white' : 'text-ribbit-dark'
              }`}>
                4.8/5
              </span>
            </div>
          </div>

          <p className={`text-lg mb-8 max-w-2xl mx-auto ${
            darkMode ? 'text-gray-300' : 'text-ribbit-dark/70'
          }`}>
            "Ribbit has revolutionized how I learn Chinese. The tone visualization feature is a game-changer!"
          </p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="#download"
              className="app-store-btn"
            >
              <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/>
              </svg>
              Download on App Store
            </a>
          </div>
        </div>
      </div>
    </section>
  );
};

export default TestimonialsSection;
