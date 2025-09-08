import React, { useState, useEffect } from 'react';
import './App.css';
import HeroSection from './components/HeroSection';
import FeaturesSection from './components/FeaturesSection';
import TestimonialsSection from './components/TestimonialsSection';
import Footer from './components/Footer';
import Header from './components/Header';

function App() {
  const [darkMode, setDarkMode] = useState(false);

  useEffect(() => {
    // Check for saved theme preference or default to light mode
    const savedTheme = localStorage.getItem('ribbit-theme');
    if (savedTheme) {
      setDarkMode(savedTheme === 'dark');
    } else {
      // Check system preference
      setDarkMode(window.matchMedia('(prefers-color-scheme: dark)').matches);
    }
  }, []);

  useEffect(() => {
    // Apply theme to document
    if (darkMode) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
    localStorage.setItem('ribbit-theme', darkMode ? 'dark' : 'light');
  }, [darkMode]);

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
  };

  return (
    <div className={`min-h-screen ${darkMode ? 'dark bg-gray-900' : 'bg-ribbit-background'}`}>
      <Header darkMode={darkMode} toggleDarkMode={toggleDarkMode} />
      <main>
        <HeroSection darkMode={darkMode} />
        <FeaturesSection darkMode={darkMode} />
        <TestimonialsSection darkMode={darkMode} />
      </main>
      <Footer darkMode={darkMode} />
    </div>
  );
}

export default App;
