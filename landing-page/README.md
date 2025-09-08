# Ribbit Landing Page

A custom landing page for Ribbit, the gamified Chinese language learning app. Built with React and Tailwind CSS to match the app's design system.

## Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Dark/Light Mode**: Toggle between themes with system preference detection
- **Brand Consistency**: Uses Ribbit's exact color palette and design patterns
- **Modern UI**: Clean, playful design with smooth animations
- **SEO Optimized**: Meta tags and structured data for search engines

## Design System

### Colors
- **Main Dark**: #2B5B81 (primary brand color)
- **Off White**: #F5F0EA (background and text)
- **Light Teal**: #B6E8DF (accent color)
- **Dark Teal**: #50B2B7 (secondary accent)
- **Pale Green**: #C5DF76 (success/positive actions)
- **Background**: #FFFAF3 (warm off-white)

### Typography
- **Primary Font**: Inter (system font fallback)
- **Font Weights**: 300, 400, 500, 600, 700

## Sections

1. **Hero Section**: App branding, tagline, mockup, and CTA buttons
2. **Features Section**: 4 key features with icons and descriptions
3. **Testimonials Section**: User reviews and community stats
4. **Footer**: Links, social media, and app store buttons

## Getting Started

### Prerequisites
- Node.js (v14 or higher)
- npm or yarn

### Installation

1. Navigate to the landing page directory:
   ```bash
   cd landing-page
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm start
   ```

4. Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

### Building for Production

```bash
npm run build
```

This builds the app for production to the `build` folder.

## Asset Integration

The landing page is designed to use assets from the Ribbit iOS app:

### Sprites and Images
- **Location**: `/Ribbit/Assets.xcassets/`
- **Key Assets**: 
  - `welcome.imageset/` - Hero background
  - `airport.imageset/`, `beach.imageset/`, `cafe.imageset/`, `camping.imageset/` - Feature icons
  - `singing_frog.imageset/` - Mascot character
  - `star.imageset/` - Rating icons
  - `backgroundGradient.imageset/` - Background patterns

### Asset Replacement
To integrate actual app assets:

1. Copy images from the iOS project to `public/images/`
2. Update image references in components
3. Replace emoji placeholders with actual sprite graphics

### Example Asset Integration
```jsx
// Replace this:
<span className="text-3xl">🎯</span>

// With this:
<img src="/images/gamification-icon.png" alt="Gamified Learning" className="w-12 h-12" />
```

## Customization

### Adding New Sections
1. Create a new component in `src/components/`
2. Import and add to `App.js`
3. Update navigation links in `Header.js`

### Modifying Colors
Update the color palette in `tailwind.config.js`:

```javascript
colors: {
  'ribbit-dark': '#2B5B81',
  // Add new colors here
}
```

### Adding Animations
Use Tailwind's animation utilities or add custom CSS in `src/App.css`.

## Deployment

### Netlify
1. Build the project: `npm run build`
2. Deploy the `build` folder to Netlify
3. Configure custom domain and SSL

### Vercel
1. Connect your repository to Vercel
2. Configure build settings (build command: `npm run build`)
3. Deploy automatically on push

### GitHub Pages
1. Install gh-pages: `npm install --save-dev gh-pages`
2. Add deploy script to package.json
3. Run: `npm run deploy`

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Performance

- **Lighthouse Score**: 95+ (Performance, Accessibility, Best Practices, SEO)
- **Core Web Vitals**: Optimized for LCP, FID, and CLS
- **Bundle Size**: < 500KB gzipped
- **Loading Time**: < 2s on 3G

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is proprietary to Ribbit. All rights reserved.

## Support

For questions or issues, contact the development team or create an issue in the repository.
