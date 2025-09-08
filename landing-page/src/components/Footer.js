import React from 'react';

const Footer = ({ darkMode }) => {
  const currentYear = new Date().getFullYear();

  const footerLinks = {
    Product: [
      { name: 'Features', href: '#features' },
      { name: 'Pricing', href: '#pricing' },
      { name: 'Download', href: '#download' },
      { name: 'Updates', href: '#updates' }
    ],
    Company: [
      { name: 'About Us', href: '#about' },
      { name: 'Contact', href: '#contact' },
      { name: 'Careers', href: '#careers' },
      { name: 'Press', href: '#press' }
    ],
    Support: [
      { name: 'Help Center', href: '#help' },
      { name: 'Community', href: '#community' },
      { name: 'Tutorials', href: '#tutorials' },
      { name: 'FAQ', href: '#faq' }
    ],
    Legal: [
      { name: 'Privacy Policy', href: '#privacy' },
      { name: 'Terms of Service', href: '#terms' },
      { name: 'Cookie Policy', href: '#cookies' },
      { name: 'GDPR', href: '#gdpr' }
    ]
  };

  const socialLinks = [
    { name: 'Twitter', icon: '🐦', href: '#' },
    { name: 'Instagram', icon: '📷', href: '#' },
    { name: 'Facebook', icon: '📘', href: '#' },
    { name: 'YouTube', icon: '📺', href: '#' }
  ];

  return (
    <footer id="footer" className={`${darkMode ? 'bg-gray-900' : 'bg-ribbit-dark'}`}>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        {/* Main footer content */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-6 gap-8 mb-12">
          {/* Brand section */}
          <div className="lg:col-span-2">
            <div className="flex items-center space-x-3 mb-6">
              <img 
                src="/images/icons/app-icon.png" 
                alt="Ribbit App Icon" 
                className="w-12 h-12 rounded-xl"
              />
              <span className="text-3xl font-medium text-ribbit-off-white">
                Ribbit
              </span>
            </div>
            
            <p className="text-ribbit-off-white/80 mb-6 max-w-md">
              Master Chinese through gamified learning experiences. Join thousands of learners 
              on their journey to fluency with our innovative tone visualization and personalized feedback.
            </p>

            {/* Social links */}
            <div className="flex space-x-4">
              {socialLinks.map((social, index) => (
                <a
                  key={index}
                  href={social.href}
                  className="w-10 h-10 bg-ribbit-off-white/10 rounded-lg flex items-center justify-center text-ribbit-off-white hover:bg-ribbit-light-teal hover:text-ribbit-dark transition-colors"
                  aria-label={social.name}
                >
                  <span className="text-lg">{social.icon}</span>
                </a>
              ))}
            </div>
          </div>

          {/* Links sections */}
          {Object.entries(footerLinks).map(([category, links]) => (
            <div key={category}>
              <h3 className="text-ribbit-off-white font-semibold mb-4">
                {category}
              </h3>
              <ul className="space-y-3">
                {links.map((link, index) => (
                  <li key={index}>
                    <a
                      href={link.href}
                      className="text-ribbit-off-white/70 hover:text-ribbit-light-teal transition-colors"
                    >
                      {link.name}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Download section */}
        <div className={`rounded-2xl p-8 mb-12 ${
          darkMode ? 'bg-gray-800' : 'bg-ribbit-off-white/10'
        }`}>
          <div className="text-center">
            <h3 className="text-2xl font-bold text-ribbit-off-white mb-4">
              Ready to Start Your Chinese Learning Journey?
            </h3>
            <p className="text-ribbit-off-white/80 mb-8 max-w-2xl mx-auto">
              Download Ribbit today and join thousands of learners who are mastering Chinese 
              with our innovative gamified approach.
            </p>
            
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a
                href="#download"
                className="app-store-btn bg-ribbit-off-white text-ribbit-dark hover:bg-ribbit-light-teal"
              >
                <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/>
                </svg>
                Download on App Store
              </a>
              
              <a
                href="#learn-more"
                className="px-8 py-4 rounded-xl font-medium text-ribbit-off-white border-2 border-ribbit-off-white/30 hover:border-ribbit-light-teal hover:bg-ribbit-light-teal hover:text-ribbit-dark transition-all"
              >
                Learn More
              </a>
            </div>
          </div>
        </div>

        {/* Bottom section */}
        <div className="border-t border-ribbit-off-white/20 pt-8">
          <div className="flex flex-col md:flex-row justify-between items-center">
            <div className="text-ribbit-off-white/60 text-sm mb-4 md:mb-0">
              © {currentYear} Ribbit. All rights reserved.
            </div>
            
            <div className="flex flex-wrap gap-6 text-sm">
              <a href="#privacy" className="text-ribbit-off-white/60 hover:text-ribbit-light-teal transition-colors">
                Privacy Policy
              </a>
              <a href="#terms" className="text-ribbit-off-white/60 hover:text-ribbit-light-teal transition-colors">
                Terms of Service
              </a>
              <a href="#cookies" className="text-ribbit-off-white/60 hover:text-ribbit-light-teal transition-colors">
                Cookie Policy
              </a>
            </div>
          </div>
        </div>
      </div>

      {/* Decorative elements */}
      <div className="relative overflow-hidden">
        <div className="absolute -top-4 left-10 w-8 h-8 bg-ribbit-light-teal/20 rounded-full floating"></div>
        <div className="absolute -top-2 right-20 w-6 h-6 bg-ribbit-pale-green/20 rounded-full floating-delayed"></div>
        <div className="absolute -bottom-4 left-1/4 w-4 h-4 bg-ribbit-dark-teal/20 rounded-full floating"></div>
      </div>
    </footer>
  );
};

export default Footer;
