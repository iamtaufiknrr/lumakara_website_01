# 🎨 Index-2 Sections Guide - Lumakara CMS

Panduan lengkap untuk mengelola sections khusus dari `index-2.html` melalui Admin Panel.

---

## 📋 Sections Overview

Index-2 memiliki layout dan sections yang berbeda dari Index-1, dengan fokus pada:
- ✨ Animasi yang lebih dinamis
- 🎬 Video integration
- 📊 Counter animations dengan Odometer
- 🎠 Carousel layouts
- 🔄 Scrolling text animations

---

## 🎯 1. Services Two Section

**CMS Location**: Homepage → Services Two Section (Index-2 Style)

### Features:
- **Layout Khusus**: 4 services dengan center image + video
- **Animation**: WOW.js fadeInLeft & fadeInRight
- **Video Popup**: YouTube video integration
- **Hover Effects**: Float animation pada center image

### Fields di CMS:
```yaml
- Section Tagline: "our services"
- Section Title: "What We Offer"
- Center Image: Main featured image (540x400)
- Video URL: YouTube video link
- Video Button Text: "Watch Video"
- Services List (4 items):
  - Icon Class: e.g., "icon-project-management"
  - Title: Service name
  - Description: Short description
  - Link URL: Service page link
  - Animation Side: left/right
```

### HTML Structure:
```html
<section class="services-two">
  <div class="services-two__middle-content">
    <img> <!-- Center Image with float-bob-y -->
    <div class="services-two__video">
      <a class="video-popup"> <!-- Video Button -->
    </div>
  </div>
  
  <ul class="services-two__list">
    <!-- 2 services (top) - fadeInLeft & fadeInRight -->
  </ul>
  
  <ul class="services-two__list style2">
    <!-- 2 services (bottom) - fadeInLeft & fadeInRight -->
  </ul>
</section>
```

### Animations Used:
- **WOW.js**: `fadeInLeft`, `fadeInRight`
- **Float Bob**: `.float-bob-y` class
- **Ripple Effect**: Video button ripple
- **Video Popup**: Magnific Popup plugin

### How to Edit in CMS:
1. Login ke Admin: http://lumakara.web.id/admin
2. Go to: **Homepage** → **Services Two Section**
3. Update fields:
   - Change tagline & title
   - Upload new center image
   - Update video URL
   - Edit 4 services (icon, title, description)
4. Click **Save** → Auto-deploy

---

## 📊 2. Counter/Stats Section

**CMS Location**: Homepage → Counter/Stats Section

### Features:
- **Odometer Animation**: Smooth number counting
- **4 Counters**: Different statistics
- **Alternating Animations**: slideInUp & slideInDown
- **Suffix Support**: k, +, M, etc.

### Fields di CMS:
```yaml
Counters (list of 4):
  - Count Number: e.g., 4, 301, 2, 813
  - Suffix: "k+", "+", "M", etc.
  - Label: Counter description
  - Animation: slideInUp/slideInDown/fadeIn
```

### Sample Data:
```json
{
  "counters": [
    {
      "count": 4,
      "suffix": "k+",
      "label": "Satisfied clients in our company",
      "animation": "slideInUp"
    },
    {
      "count": 301,
      "suffix": "",
      "label": "Working hours were the spent",
      "animation": "slideInDown"
    }
  ]
}
```

### HTML Structure:
```html
<section class="counter-two">
  <div class="counter-two__single">
    <div class="count-box">1.</div>
    <div class="counter-box">
      <h2>
        <span class="odometer" data-count="4">00</span>
        <span class="k">k</span>
        <span class="plus icon-plus-1"></span>
      </h2>
    </div>
    <p>Label text</p>
  </div>
</section>
```

### Animations Used:
- **Odometer.js**: Number counting animation
- **WOW.js**: `slideInUp`, `slideInDown`
- **jQuery Appear**: Triggers when element is visible

### Configuration:
```javascript
// Odometer plugin automatically animates numbers
// data-count attribute sets target number
<span class="odometer" data-count="4">00</span>
```

---

## 🎠 3. Gallery Carousel Section

**CMS Location**: Homepage → Gallery Carousel Section

### Features:
- **Owl Carousel**: Responsive image carousel
- **4+ Gallery Items**: Portfolio/project showcase
- **Hover Overlay**: Category & title on hover
- **Navigation Arrows**: Custom styled navigation

### Fields di CMS:
```yaml
- Section Tagline: "latest projects"
- Section Title: "Our Working Gallery"
- Gallery Items (list):
  - Image: Project image (390x420 or 390x470)
  - Category: e.g., "Business Idea"
  - Title: Project title
  - Link URL: Project detail page
```

### Owl Carousel Settings:
```javascript
{
  "loop": true,
  "autoplay": true,
  "margin": 30,
  "nav": true,
  "dots": false,
  "smartSpeed": 500,
  "autoplayTimeout": 10000,
  "responsive": {
    "0": {"items": 4},
    "768": {"items": 4},
    "992": {"items": 4},
    "1200": {"items": 4}
  }
}
```

### HTML Structure:
```html
<section class="gallery-two">
  <div class="owl-carousel gallery-two__carousel">
    <div class="gallery-two__single">
      <div class="gallery-two__single-img">
        <img>
        <div class="overlay-content">
          <p>Category</p>
          <h2><a>Title</a></h2>
        </div>
      </div>
    </div>
  </div>
</section>
```

### Animations:
- **Owl Carousel**: Smooth slide transitions
- **Hover Effect**: Overlay fade-in
- **Image Sizes**: Mixed heights (420px, 470px, 330px)

---

## 🔄 4. Scrolling Text Section

**CMS Location**: Homepage → Scrolling Text Section

### Features:
- **Infinite Scroll**: GSAP ScrollTrigger animation
- **Repeating Text**: Text repeats 3 times
- **Icons**: Arrow icons between text
- **Smooth Animation**: Horizontal scroll effect

### Fields di CMS:
```yaml
- Text: "Marketing" (or any text)
- Icon Class: "icon-right-arrow-1"
- Repeat Count: 3
```

### HTML Structure:
```html
<section class="feature-one">
  <div class="feature-one__wrap">
    <div class="feature-one__title-box">
      <h2 class="feature-one__title">
        <span class="icon-right-arrow-1 icon-one"></span>
        Marketing
      </h2>
    </div>
    <!-- Repeat 3 times -->
  </div>
</section>
```

### Animations Used:
- **GSAP**: GreenSock Animation Platform
- **ScrollTrigger**: Scroll-based animations
- **SplitText**: Text animation effects

### Configuration:
```javascript
// GSAP ScrollTrigger untuk horizontal scroll
gsap.to(".feature-one__wrap", {
  x: "-100%",
  scrollTrigger: {
    trigger: ".feature-one",
    scrub: true
  }
});
```

---

## 🎯 5. CTA Section (Get In Touch)

**CMS Location**: Homepage → CTA Section

### Features:
- **Full Width**: Prominent call-to-action
- **Button**: Primary CTA button
- **Background**: Optional background image

### Fields di CMS:
```yaml
- Heading: "Get In Touch"
- Button Text: "Send A Message"
- Button URL: "/contact.html"
- Background Image: Optional
```

### HTML Structure:
```html
<section class="slogan-one">
  <div class="slogan-one__inner">
    <div class="text-box">
      <h2>Get In Touch</h2>
    </div>
    <div class="btn-box">
      <a class="thm-btn">Send A Message</a>
    </div>
  </div>
</section>
```

---

## 🏢 6. Brand Logos Section

**CMS Location**: Homepage → Brand Logos

### Features:
- **Partner Logos**: Display brand/partner logos
- **Responsive**: Adjusts to screen size
- **Linked**: Each logo can link to partner site

### Fields di CMS:
```yaml
Logos (list):
  - Logo Image: Brand logo image
  - Brand Name: Alt text
  - Link URL: Partner website
```

### HTML Structure:
```html
<section class="brand-one brand-one--two">
  <div class="brand-one__inner">
    <ul>
      <li><a href="#"><img src="brand-1.png"></a></li>
      <!-- Repeat for each logo -->
    </ul>
  </div>
</section>
```

---

## 🎨 Animation Libraries Used

### 1. **WOW.js**
```html
<!-- Trigger animations on scroll -->
<div class="wow fadeInLeft" data-wow-delay="100ms" data-wow-duration="1000ms">
```

**Animations Available**:
- `fadeInLeft`, `fadeInRight`
- `fadeInUp`, `fadeInDown`
- `slideInUp`, `slideInDown`
- `zoomIn`, `bounceIn`

### 2. **Odometer.js**
```html
<!-- Animated number counter -->
<span class="odometer" data-count="4">00</span>
```

**Configuration**:
- Auto-starts when visible
- Smooth counting animation
- Customizable speed

### 3. **Owl Carousel**
```javascript
$('.owl-carousel').owlCarousel({
  loop: true,
  autoplay: true,
  nav: true
});
```

**Features**:
- Responsive breakpoints
- Touch/swipe enabled
- Custom navigation

### 4. **GSAP (GreenSock)**
```javascript
// Advanced animations
gsap.to(element, {
  x: 100,
  duration: 1,
  scrollTrigger: {...}
});
```

**Plugins Used**:
- ScrollTrigger
- SplitText
- Timeline

### 5. **Magnific Popup**
```html
<!-- Video popup -->
<a class="video-popup" href="youtube-url">
```

**Features**:
- YouTube/Vimeo support
- Responsive
- Gallery support

---

## 🔧 Integration Guide

### Step 1: Update CMS Content

1. **Login ke Admin**
   ```
   http://lumakara.web.id/admin
   ```

2. **Navigate to Homepage Sections**
   - Services Two Section
   - Counter Stats
   - Gallery Carousel
   - Scrolling Text
   - CTA Section
   - Brand Logos

3. **Edit Content**
   - Update text, images, links
   - Adjust animations
   - Configure settings

4. **Publish**
   - Click Save
   - Wait for auto-deploy (~30 seconds)

### Step 2: Verify on Site

1. **Check Animations**
   - Scroll through page
   - Verify WOW.js animations trigger
   - Check counter animations
   - Test carousel navigation

2. **Test Video Popup**
   - Click video button
   - Verify YouTube video loads
   - Test close functionality

3. **Mobile Responsive**
   - Test on mobile devices
   - Verify carousel works
   - Check touch/swipe

---

## 📱 Responsive Behavior

### Services Two Section
- **Desktop**: 4 items with center image
- **Tablet**: 2 columns
- **Mobile**: Single column stack

### Counter Section
- **Desktop**: 4 columns
- **Tablet**: 2 columns
- **Mobile**: 1 column

### Gallery Carousel
- **Desktop**: 4 items visible
- **Tablet**: 2-3 items
- **Mobile**: 1-2 items

---

## 🎯 Best Practices

### Images:
1. **Services Center Image**: 540x400px
2. **Gallery Items**: 390x420px or 390x470px
3. **Brand Logos**: Transparent PNG, ~200x80px
4. **Optimize**: Compress images before upload

### Animations:
1. **Delay**: 100-500ms between elements
2. **Duration**: 1000-1500ms for smooth effect
3. **Avoid Overuse**: Don't animate everything
4. **Performance**: Test on mobile

### Content:
1. **Keep Text Concise**: Short, impactful
2. **Consistent Icons**: Use same icon family
3. **Clear CTAs**: Obvious action buttons
4. **Accessibility**: Alt text for images

---

## 🛠️ Troubleshooting

### Animations Not Working
**Problem**: WOW.js animations not triggering

**Solutions**:
1. Check WOW.js is loaded
2. Verify CSS classes are correct
3. Check data-wow attributes
4. Clear browser cache

### Counter Not Counting
**Problem**: Odometer not animating

**Solutions**:
1. Verify odometer.js loaded
2. Check data-count attribute
3. Ensure jQuery Appear plugin loaded
4. Test scroll position

### Carousel Not Sliding
**Problem**: Owl Carousel not working

**Solutions**:
1. Check owl.carousel.js loaded
2. Verify data-owl-options syntax
3. Test navigation arrows
4. Check responsive settings

### Video Popup Not Opening
**Problem**: Video popup doesn't work

**Solutions**:
1. Verify Magnific Popup loaded
2. Check YouTube URL format
3. Test .video-popup class
4. Check popup initialization

---

## 📊 Performance Optimization

### Image Optimization:
```bash
# Compress images
- JPG: 80% quality
- PNG: TinyPNG compression
- WebP: Modern browsers
```

### Lazy Loading:
```html
<!-- Add lazy loading -->
<img loading="lazy" src="image.jpg">
```

### Animation Performance:
```css
/* Use GPU acceleration */
.animated-element {
  will-change: transform;
  transform: translateZ(0);
}
```

---

## 🎓 Learning Resources

### WOW.js:
- Docs: https://wowjs.uk/docs.html
- Examples: https://wowjs.uk/

### Odometer:
- GitHub: https://github.hubspot.com/odometer/
- Demos: Interactive counter examples

### Owl Carousel:
- Docs: https://owlcarousel2.github.io/OwlCarousel2/
- Examples: Various carousel types

### GSAP:
- Docs: https://greensock.com/docs/
- Learning: https://greensock.com/learning/

---

## ✅ Checklist

Before publishing Index-2 style pages:

- [ ] All images optimized and uploaded
- [ ] Video URL tested and working
- [ ] Counter numbers accurate
- [ ] Gallery items have correct images
- [ ] Brand logos uploaded
- [ ] All links working
- [ ] Animations smooth and timed well
- [ ] Mobile responsive checked
- [ ] Cross-browser tested
- [ ] Performance optimized
- [ ] SEO meta tags set
- [ ] Accessibility verified

---

## 🚀 Quick Reference

| Section | CMS Path | Key Features |
|---------|----------|--------------|
| **Services Two** | Homepage → Services Two | 4 services, center video |
| **Counter Stats** | Homepage → Counter Stats | Odometer animation, 4 counters |
| **Gallery** | Homepage → Gallery Carousel | Owl carousel, hover overlay |
| **Scrolling Text** | Homepage → Scrolling Text | GSAP horizontal scroll |
| **CTA** | Homepage → CTA Section | Full-width call-to-action |
| **Brand Logos** | Homepage → Brand Logos | Partner logo display |

---

## 📞 Support

**Questions?**
- Email: taufiknrr.mail@gmail.com
- Docs: See `CMS_FEATURES.md`
- Admin Guide: `admin/README.md`

---

**Version**: 1.0  
**Last Updated**: October 30, 2024  
**Maintainer**: Taufik Nur Rahman Ridwan

---

*Happy editing! All sections from index-2.html are now manageable through CMS! 🎉*
