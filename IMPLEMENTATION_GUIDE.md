# Mason Crest Theme - Implementation Guide

## Quick Start

This is a complete, production-ready Shopify theme. Follow these steps to deploy:

### 1. Upload to Shopify

**Option A: Theme Upload (Recommended)**
1. Compress the entire theme folder as a .zip file
2. Go to Shopify Admin > Online Store > Themes
3. Click "Upload theme"
4. Select your .zip file
5. Click "Publish" when ready

**Option B: Shopify CLI**
```bash
shopify theme push
```

### 2. Initial Configuration

Once uploaded, configure these essential settings:

#### A. Logo & Branding
- Navigate to: **Theme Settings > Logo**
- Upload your Mason Crest logo (or use the default "MASON CREST" text)
- Upload favicon.svg for browser tabs
- Colors are pre-configured but can be adjusted in **Theme Settings > Colors**

#### B. Navigation Setup
The theme includes these default menu items:
- Home
- All Products
- Categories (dropdown with all collections)
- About
- Contact

To customize:
1. Go to **Navigation** in Shopify Admin
2. Edit "Main menu"
3. Ensure links match the theme structure

#### C. Homepage Setup
The homepage includes these sections (in order):
1. **Hero Section** - Add your hero image and customize text
2. **Brand Values** - Upload 4 icons for: Premium Quality, Curated Gear, Peak Performance, Fast Shipping
3. **Featured Categories** - Select which collections to display
4. **Products Carousel** - Choose a collection for featured products
5. **Testimonials** - Add 3 customer testimonials
6. **Newsletter** - Email signup (no additional setup needed)

To customize:
1. Go to **Online Store > Themes**
2. Click "Customize" on Mason Crest theme
3. Edit each section as needed

### 3. Products & Collections

#### Create Collections
1. Go to **Products > Collections**
2. Create these recommended collections:
   - All Products (automated)
   - Fitness Accessories
   - Recovery & Wellness
   - Strength Training
   - Home Fitness
   - Health Tech
   - Best Sellers
   - New Arrivals

#### Add Products
1. Go to **Products > All Products**
2. Add products with:
   - High-quality images (recommended: 1200x1200px)
   - Detailed descriptions
   - Pricing
   - Variants (if applicable)
3. Assign products to appropriate collections

### 4. Pages Setup

Create these pages in **Online Store > Pages**:

#### Required Pages
- **About** (`/pages/about`)
- **Contact** (`/pages/contact`)
- **Our Story** (`/pages/our-story`)
- **Mission** (`/pages/mission`)
- **Sustainability** (`/pages/sustainability`)
- **FAQ** (`/pages/faq`)

#### Legal Pages (Auto-Generated)
Shopify automatically generates these:
- Privacy Policy
- Terms of Service
- Refund Policy
- Shipping Policy

To enable:
1. Go to **Settings > Policies**
2. Click "Create from template" for each policy
3. The theme will automatically style them

### 5. Theme Customization Options

#### Colors
- **Theme Settings > Colors**
- Pre-configured with Mason Crest brand colors
- Customizable: backgrounds, text, buttons, accents

#### Typography
- **Theme Settings > Typography**
- Default: Modern sans-serif
- Adjustable: heading font, body font, scale

#### Layout
- **Theme Settings > Layout**
- Page width: 1200px (default)
- Section spacing
- Grid spacing

#### Product Cards
- **Theme Settings > Product Cards**
- Corner radius: 8px
- Shadow effects
- Border styles

#### Buttons
- **Theme Settings > Buttons**
- Corner radius: 4px
- Border thickness: 2px
- Shadow effects

### 6. Section-by-Section Customization

#### Hero Section
- Background image upload
- Headline text
- Subheadline text
- Button text and link
- Colors for all elements
- Overlay opacity

#### Brand Values
- 4 value blocks (add/remove as needed)
- Icon upload for each value
- Title and description
- Background and text colors

#### Featured Categories
- Add category blocks
- Select collection for each
- Optional custom images
- Card styling

#### Products Carousel
- Select product collection
- Number of products to show (4-20)
- Horizontal scroll
- All colors customizable

#### Testimonials
- Add testimonial blocks
- Customer image upload
- Star rating (0-5)
- Quote text
- Customer name and title
- All styling customizable

#### Newsletter
- Heading and description
- Email input placeholder
- Button text
- Success/error messages
- Full color customization

### 7. Advanced Features

#### Search Functionality
- Predictive search enabled by default
- Search modal opens from header icon
- Search bars on collection pages
- Dedicated search results page

#### Cart System
- Drawer cart (default)
- Can switch to page cart in Theme Settings
- Live cart updates
- Quantity adjustments
- Remove items

#### Mobile Experience
- Hamburger menu with MC monogram
- Touch-friendly elements
- Swipeable carousals
- Responsive product grids
- Sticky bottom cart button

### 8. Testing Checklist

Before going live, test:

- [ ] Homepage displays correctly
- [ ] All navigation links work
- [ ] Product pages load with images
- [ ] Add to cart functionality works
- [ ] Cart drawer opens and updates
- [ ] Search functionality works
- [ ] Mobile menu opens/closes
- [ ] Checkout process completes
- [ ] All pages are styled correctly
- [ ] Legal pages display properly
- [ ] Newsletter signup works
- [ ] Forms submit correctly

### 9. Performance Optimization

The theme is optimized with:
- Lazy loading for images
- Minimal JavaScript
- Efficient CSS
- Shopify CDN for assets
- Responsive images

No additional optimization needed.

### 10. Troubleshooting

#### Products Not Showing
- Ensure products are published
- Check collection assignments
- Verify product availability

#### Images Not Loading
- Check image file sizes (optimize if >500KB)
- Ensure images are uploaded to products/collections
- Verify image URLs in sections

#### Cart Not Updating
- Clear browser cache
- Check Shopify payment settings
- Verify cart is enabled in Theme Settings

#### Mobile Menu Not Working
- Clear cache and hard refresh
- Ensure JavaScript is enabled
- Check browser console for errors

### 11. Maintenance

#### Regular Updates
- Update product images seasonally
- Refresh testimonials
- Update hero section messaging
- Add new products to featured collections

#### Content Updates
- Keep legal pages current
- Update FAQ with common questions
- Refresh About page content
- Update shipping information

### 12. Support Resources

#### Shopify Documentation
- [Shopify Themes Guide](https://shopify.dev/themes)
- [Liquid Reference](https://shopify.dev/api/liquid)
- [Theme Settings](https://shopify.dev/themes/architecture/settings)

#### Theme-Specific
- All sections are documented with inline comments
- Schema settings include help text
- README.md for theme overview

### 13. Going Live Checklist

- [ ] Logo uploaded
- [ ] Favicon configured
- [ ] All pages created
- [ ] Products added to collections
- [ ] Homepage sections customized
- [ ] Legal pages generated
- [ ] Navigation menus configured
- [ ] Payment methods set up
- [ ] Shipping rates configured
- [ ] Domain connected
- [ ] SSL certificate active
- [ ] Test order completed
- [ ] Mobile experience verified
- [ ] All links tested

---

## Need Help?

For additional support or custom development:
- Review inline documentation in theme files
- Check Shopify Community forums
- Contact Shopify Support

**Congratulations on your new premium theme!**

Mason Crest Theme v1.0.0
