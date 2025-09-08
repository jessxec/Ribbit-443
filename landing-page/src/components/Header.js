import React from 'react';

const Header = ({ darkMode, toggleDarkMode }) => {
  return (
    <header className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
      darkMode ? 'bg-gray-900/90 backdrop-blur-md' : 'bg-ribbit-off-white/90 backdrop-blur-md'
    }`}>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center py-4">
          {/* Logo */}
          <div className="flex items-center space-x-3">
            <img 
              src="/images/icons/app-icon.png" 
              alt="Ribbit App Icon" 
              className="w-10 h-10 rounded-xl"
            />
            <span className={`text-2xl font-medium ${darkMode ? 'text-white' : 'text-ribbit-dark'}`}>
              Ribbit
            </span>
          </div>

          {/* Navigation */}
          <nav className="hidden md:flex items-center space-x-8">
            <a href="#features" className={`font-medium transition-colors ${
              darkMode ? 'text-gray-300 hover:text-white' : 'text-ribbit-dark hover:text-ribbit-dark-teal'
            }`}>
              Features
            </a>
            <a href="#testimonials" className={`font-medium transition-colors ${
              darkMode ? 'text-gray-300 hover:text-white' : 'text-ribbit-dark hover:text-ribbit-dark-teal'
            }`}>
              Community
            </a>
            <a href="#download" className={`font-medium transition-colors ${
              darkMode ? 'text-gray-300 hover:text-white' : 'text-ribbit-dark hover:text-ribbit-dark-teal'
            }`}>
              Download
            </a>
          </nav>

          {/* Dark mode toggle and CTA */}
          <div className="flex items-center space-x-4">
            <button
              onClick={toggleDarkMode}
              className={`p-2 rounded-lg transition-colors ${
                darkMode 
                  ? 'bg-gray-700 text-yellow-400 hover:bg-gray-600' 
                  : 'bg-ribbit-light-teal text-ribbit-dark hover:bg-ribbit-pale-green'
              }`}
              aria-label="Toggle dark mode"
            >
              {darkMode ? (
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clipRule="evenodd" />
                </svg>
              ) : (
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z" />
                </svg>
              )}
            </button>
            
            <a
              href="#download"
              className={`px-6 py-2 rounded-lg font-medium transition-all ${
                darkMode
                  ? 'bg-ribbit-dark-teal text-white hover:bg-ribbit-light-teal'
                  : 'bg-ribbit-dark text-ribbit-off-white hover:bg-ribbit-dark-teal'
              }`}
            >
              Get Started
            </a>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
