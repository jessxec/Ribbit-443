#!/usr/bin/env node

/**
 * Asset Extraction Script for Ribbit Landing Page
 * 
 * This script helps extract and organize assets from the iOS project
 * for use in the landing page.
 */

const fs = require('fs');
const path = require('path');

// Asset mapping from iOS project to web assets
const assetMapping = {
  // Hero and branding
  'welcome': {
    source: '../Ribbit/Assets.xcassets/welcome.imageset/',
    destination: 'public/images/hero/',
    files: ['Welcome-1.png', 'Welcome@2x.png']
  },
  
  // Feature icons
  'airport': {
    source: '../Ribbit/Assets.xcassets/airport.imageset/',
    destination: 'public/images/features/',
    files: ['Airport.png', 'Airport@2x.png', 'Airport@3x.png']
  },
  'beach': {
    source: '../Ribbit/Assets.xcassets/beach.imageset/',
    destination: 'public/images/features/',
    files: ['Beach.png', 'Beach@2x.png', 'Beach@3x.png']
  },
  'cafe': {
    source: '../Ribbit/Assets.xcassets/cafe.imageset/',
    destination: 'public/images/features/',
    files: ['Cafe.png', 'Cafe@2x.png', 'Cafe@3x.png']
  },
  'camping': {
    source: '../Ribbit/Assets.xcassets/camping.imageset/',
    destination: 'public/images/features/',
    files: ['Camping.png', 'Camping@2x.png', 'Camping@3x.png']
  },
  
  // Mascot and characters
  'singing_frog': {
    source: '../Ribbit/Assets.xcassets/singing_frog.imageset/',
    destination: 'public/images/mascot/',
    files: ['singing_frog.png']
  },
  'dragonfly': {
    source: '../Ribbit/Assets.xcassets/dragonfly.imageset/',
    destination: 'public/images/mascot/',
    files: ['dragonfly.png', 'dragonfly@2x.png', 'dragonfly@3x.png']
  },
  'lotus': {
    source: '../Ribbit/Assets.xcassets/lotus.imageset/',
    destination: 'public/images/mascot/',
    files: ['lotus.png', 'lotus@2x.png', 'lotus@3x.png']
  },
  
  // UI elements
  'star': {
    source: '../Ribbit/Assets.xcassets/star.imageset/',
    destination: 'public/images/ui/',
    files: ['Star 27.png', 'Star 27@2x.png', 'Star 27@3x.png']
  },
  'starOff': {
    source: '../Ribbit/Assets.xcassets/starOff.imageset/',
    destination: 'public/images/ui/',
    files: ['starOff.png', 'starOff@2x.png', 'starOff@3x.png']
  },
  
  // Backgrounds
  'backgroundGradient': {
    source: '../Ribbit/Assets.xcassets/backgroundGradient.imageset/',
    destination: 'public/images/backgrounds/',
    files: ['Background.png', 'Background@2x.png', 'Background@3x.png']
  },
  'map': {
    source: '../Ribbit/Assets.xcassets/map.imageset/',
    destination: 'public/images/backgrounds/',
    files: ['Map Screen.png', 'Map Screen@2x.png', 'Map Screen@3x.png']
  }
};

function createDirectories() {
  console.log('Creating asset directories...');
  
  const directories = [
    'public/images/hero',
    'public/images/features',
    'public/images/mascot',
    'public/images/ui',
    'public/images/backgrounds'
  ];
  
  directories.forEach(dir => {
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
      console.log(`✓ Created directory: ${dir}`);
    }
  });
}

function copyAssets() {
  console.log('Copying assets from iOS project...');
  
  Object.entries(assetMapping).forEach(([key, config]) => {
    const sourceDir = path.resolve(config.source);
    const destDir = path.resolve(config.destination);
    
    if (!fs.existsSync(sourceDir)) {
      console.log(`⚠️  Source directory not found: ${sourceDir}`);
      return;
    }
    
    config.files.forEach(file => {
      const sourceFile = path.join(sourceDir, file);
      const destFile = path.join(destDir, file);
      
      if (fs.existsSync(sourceFile)) {
        fs.copyFileSync(sourceFile, destFile);
        console.log(`✓ Copied: ${file}`);
      } else {
        console.log(`⚠️  File not found: ${sourceFile}`);
      }
    });
  });
}

function generateAssetManifest() {
  console.log('Generating asset manifest...');
  
  const manifest = {
    generated: new Date().toISOString(),
    assets: {}
  };
  
  Object.entries(assetMapping).forEach(([key, config]) => {
    manifest.assets[key] = {
      destination: config.destination,
      files: config.files
    };
  });
  
  fs.writeFileSync(
    'public/images/asset-manifest.json',
    JSON.stringify(manifest, null, 2)
  );
  
  console.log('✓ Generated asset manifest: public/images/asset-manifest.json');
}

function main() {
  console.log('🎨 Ribbit Landing Page Asset Extractor\n');
  
  try {
    createDirectories();
    copyAssets();
    generateAssetManifest();
    
    console.log('\n✅ Asset extraction complete!');
    console.log('\nNext steps:');
    console.log('1. Review copied assets in public/images/');
    console.log('2. Update component imports to use actual images');
    console.log('3. Replace emoji placeholders with sprite graphics');
    console.log('4. Optimize images for web (compress, resize)');
    
  } catch (error) {
    console.error('❌ Error during asset extraction:', error.message);
    process.exit(1);
  }
}

if (require.main === module) {
  main();
}

module.exports = { assetMapping, createDirectories, copyAssets, generateAssetManifest };
