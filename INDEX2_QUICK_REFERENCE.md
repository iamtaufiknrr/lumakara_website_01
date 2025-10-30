# ⚡ Index-2 Quick Reference Card

Quick guide untuk mengelola Index-2 sections di Admin Panel.

---

## 🎯 Sections dari Index-2

### 1. **Services Two** (What We Offer)
**Layout**: 4 services + center video  
**Path**: Homepage → Services Two Section  
**Key Features**:
- Center image dengan video popup
- 4 service items (2 kiri, 2 kanan)
- WOW.js animations (fadeInLeft/Right)
- YouTube video integration

**Quick Edit**:
```
- Update center image (540x400)
- Change video URL (YouTube)
- Edit 4 services (icon, title, desc)
- Set animation side (left/right)
```

---

### 2. **Counter Stats**
**Layout**: 4 animated counters  
**Path**: Homepage → Counter Stats  
**Key Features**:
- Odometer number animation
- Alternating slide animations
- Custom suffix support (k, +, M)

**Quick Edit**:
```
- Set count numbers
- Add suffix (k+, M, etc.)
- Update labels
- Choose animation (slideInUp/Down)
```

**Sample**:
```json
{
  "count": 4,
  "suffix": "k+",
  "label": "Satisfied clients",
  "animation": "slideInUp"
}
```

---

### 3. **Gallery Carousel** (Our Working Gallery)
**Layout**: Owl Carousel  
**Path**: Homepage → Gallery Carousel  
**Key Features**:
- Responsive carousel
- 4+ gallery items
- Hover overlay effect
- Custom navigation arrows

**Quick Edit**:
```
- Upload images (390x420 or 390x470)
- Set category & title
- Add project links
- Configure autoplay
```

**Image Sizes**:
- Standard: 390x420px
- Tall: 390x470px
- Short: 390x330px

---

### 4. **Scrolling Text** (Marketing Animation)
**Layout**: GSAP horizontal scroll  
**Path**: Homepage → Scrolling Text  
**Key Features**:
- Infinite horizontal scroll
- GSAP ScrollTrigger
- Repeating text with icons

**Quick Edit**:
```
- Change text ("Marketing")
- Set icon class
- Adjust repeat count (default: 3)
```

---

### 5. **CTA Section** (Get In Touch)
**Layout**: Full-width call-to-action  
**Path**: Homepage → CTA Section  
**Key Features**:
- Prominent heading
- Primary CTA button
- Optional background image

**Quick Edit**:
```
- Update heading
- Change button text & URL
- Upload background (optional)
```

---

### 6. **Brand Logos**
**Layout**: Partner logos row  
**Path**: Homepage → Brand Logos  
**Key Features**:
- 5+ brand logos
- Linked to partner sites
- Responsive layout

**Quick Edit**:
```
- Upload logos (PNG, transparent)
- Add brand names (alt text)
- Set partner URLs
```

**Logo Size**: ~200x80px, transparent PNG

---

## 🎨 Animation Reference

### WOW.js Animations
```html
fadeInLeft      ← From left
fadeInRight     → From right
slideInUp       ↑ From bottom
slideInDown     ↓ From top
fadeIn          ⚡ Fade in
zoomIn          🔍 Zoom effect
```

**Usage in CMS**:
- Set in "Animation Side" field
- Delay: 0ms, 100ms, 200ms, etc.
- Duration: 1000ms - 1500ms

### Odometer Counter
```html
<span class="odometer" data-count="4">00</span>
```

**CMS Fields**:
- Count Number: Target number
- Suffix: k, +, M, etc.
- Animation: Scroll trigger

### Owl Carousel Settings
```javascript
{
  loop: true,        // Infinite loop
  autoplay: true,    // Auto-slide
  margin: 30,        // Space between items
  nav: true,         // Show arrows
  items: 4           // Items visible
}
```

---

## 📐 Image Size Guide

| Section | Recommended Size | Format |
|---------|-----------------|--------|
| **Services Center** | 540x400px | JPG |
| **Gallery Standard** | 390x420px | JPG |
| **Gallery Tall** | 390x470px | JPG |
| **Gallery Short** | 390x330px | JPG |
| **Brand Logo** | 200x80px | PNG (transparent) |
| **Team Photo** | 315x340px | JPG |
| **Blog Image** | 410x450px | JPG |

---

## 🔧 Common Tasks

### Update Services Section
1. Login → Homepage → Services Two
2. Upload new center image
3. Update video URL (YouTube)
4. Edit 4 services
5. Save → Auto-deploy

### Add Gallery Items
1. Login → Homepage → Gallery Carousel
2. Click "Add Gallery Item"
3. Upload image (390x420)
4. Set category & title
5. Save

### Change Counter Numbers
1. Login → Homepage → Counter Stats
2. Update count numbers
3. Adjust suffixes
4. Save

### Update CTA
1. Login → Homepage → CTA Section
2. Change heading
3. Update button text & URL
4. Save

---

## 🎯 Quick Fixes

### Animation Not Working?
✅ Check WOW.js loaded  
✅ Verify class names  
✅ Clear browser cache  
✅ Test scroll position

### Counter Not Counting?
✅ Check data-count attribute  
✅ Verify Odometer.js loaded  
✅ Test jQuery Appear  
✅ Scroll to element

### Carousel Not Sliding?
✅ Check Owl Carousel loaded  
✅ Verify data-owl-options  
✅ Test navigation arrows  
✅ Check responsive settings

### Video Not Playing?
✅ Check YouTube URL  
✅ Verify Magnific Popup  
✅ Test .video-popup class  
✅ Check popup init

---

## 📱 Responsive Breakpoints

```css
/* Mobile */
@media (max-width: 767px) {
  - Single column layout
  - Stack elements
  - Hide some animations
}

/* Tablet */
@media (768px - 991px) {
  - 2 column grid
  - Adjust carousel items
  - Reduce margins
}

/* Desktop */
@media (min-width: 992px) {
  - Full 4 column layout
  - All animations enabled
  - Optimal spacing
}
```

---

## 🚀 Performance Tips

### Images
✅ Compress before upload (< 500KB)  
✅ Use WebP for modern browsers  
✅ Add lazy loading  
✅ Optimize dimensions

### Animations
✅ Use GPU acceleration  
✅ Limit simultaneous animations  
✅ Test on mobile  
✅ Optimize delay timing

### Scripts
✅ Load libraries in footer  
✅ Minify JavaScript  
✅ Use CDN for libraries  
✅ Defer non-critical scripts

---

## 📊 Content Guidelines

### Service Descriptions
- **Length**: 80-120 characters
- **Tone**: Professional, concise
- **Focus**: Benefits, not features

### Counter Labels
- **Length**: 30-50 characters
- **Format**: Start with verb or noun
- **Example**: "Satisfied clients in our company"

### Gallery Titles
- **Length**: 20-40 characters
- **Format**: Project or category name
- **Example**: "Digital Marketing Campaign"

### CTA Heading
- **Length**: 2-5 words
- **Format**: Action-oriented
- **Example**: "Get In Touch", "Start Your Project"

---

## ✅ Pre-Launch Checklist

**Before Publishing Index-2 Pages**:

- [ ] All images compressed & uploaded
- [ ] Video URL tested
- [ ] Counter numbers accurate
- [ ] Gallery has 4+ items
- [ ] Brand logos uploaded
- [ ] All links working
- [ ] Animations tested
- [ ] Mobile responsive verified
- [ ] Cross-browser tested
- [ ] Performance optimized
- [ ] SEO meta tags set

---

## 🎓 Learn More

**Full Documentation**:
- `INDEX2_SECTIONS_GUIDE.md` - Detailed guide
- `CMS_FEATURES.md` - All CMS features
- `admin/README.md` - Admin user guide

**External Resources**:
- WOW.js: https://wowjs.uk/
- Owl Carousel: https://owlcarousel2.github.io/
- GSAP: https://greensock.com/
- Odometer: https://github.hubspot.com/odometer/

---

## 📞 Quick Support

**Need Help?**  
Email: taufiknrr.mail@gmail.com  
Admin: http://lumakara.web.id/admin

---

**Print this page for quick reference! 📋**

---

**Version**: 1.0  
**Date**: October 30, 2024  
**Owner**: Taufik Nur Rahman Ridwan
