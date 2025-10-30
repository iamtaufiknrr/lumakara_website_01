# Lumakara Website

Official website for Lumakara

## 🌐 Live Site
- **Production**: [http://lumakara.web.id/](http://lumakara.web.id/)
- **Admin Panel**: [http://lumakara.web.id/admin](http://lumakara.web.id/admin) 🎯
- **Repository**: [https://github.com/iamtaufiknrr/lumakara_website_01.git](https://github.com/iamtaufiknrr/lumakara_website_01.git)

## 👤 Owner
- **Name**: Taufik Nur Rahman Ridwan
- **Email**: taufiknrr.mail@gmail.com

## 🎨 Content Management System (CMS)

This website includes a **powerful admin panel** for managing all content without coding!

### Quick Access:
- **Admin URL**: [http://lumakara.web.id/admin](http://lumakara.web.id/admin)
- **Documentation**: See `QUICK_START_ADMIN.md` for 5-minute setup
- **CMS Type**: Decap CMS (formerly Netlify CMS)
- **Authentication**: Netlify Identity

### What You Can Manage:
- 📝 Blog posts & articles
- 💼 Portfolio projects
- 🛠️ Services & offerings
- 👥 Team member profiles
- 💬 Testimonials & reviews
- ❓ FAQ content
- 💰 Pricing plans
- 📄 Custom pages
- 🏠 Homepage sections
- 🧭 Navigation menus
- 📧 Contact form messages
- 🖼️ Media gallery
- ⚙️ Site settings & SEO

### Features:
- ✅ No coding required
- ✅ User-friendly interface
- ✅ Markdown editor with preview
- ✅ Image upload & management
- ✅ Auto-deploy on save
- ✅ Multi-user support
- ✅ Editorial workflow
- ✅ SEO optimization tools
- ✅ Mobile responsive

### Quick Start:
```bash
# 1. Push to GitHub
git push origin main

# 2. Enable Netlify Identity & Git Gateway
# (via Netlify Dashboard)

# 3. Invite admin user
# (via Netlify Identity tab)

# 4. Access admin panel
# http://lumakara.web.id/admin
```

**📚 Full Documentation**: 
- `QUICK_START_ADMIN.md` - 5-minute setup guide
- `CMS_SETUP_GUIDE.md` - Detailed setup instructions
- `CMS_FEATURES.md` - Complete features list
- `INDEX2_SECTIONS_GUIDE.md` - Index-2 specific sections guide
- `INDEX2_QUICK_REFERENCE.md` - Quick reference for Index-2
- `admin/README.md` - Admin user guide

## 🚀 Deployment

This website is deployed on [Netlify](https://netlify.com/) with automatic deployments from the GitHub repository.

### Netlify Configuration

The site is configured with:
- Custom domain: `lumakara.web.id`
- Automatic HTTPS
- CDN optimization
- Security headers
- Asset caching

### Build Settings

This is a static HTML website with no build process required.

- **Build Command**: `echo 'Static site - no build needed'`
- **Publish Directory**: `.` (root)

## 📁 Project Structure

```
.
├── index.html              # Main homepage
├── index-2.html            # Alternative homepage
├── index-one-page.html     # One-page version
├── about.html              # About page
├── services.html           # Services page
├── contact.html            # Contact page
├── blog.html               # Blog page
├── portfolio.html          # Portfolio page
├── team.html               # Team page
├── assets/                 # Static assets (CSS, JS, images)
│   ├── css/                # Stylesheets
│   ├── js/                 # JavaScript files
│   │   └── cms-integration.js  # CMS integration script
│   ├── images/             # Images
│   │   └── uploads/        # CMS uploaded media
│   └── vendors/            # Third-party libraries
├── admin/                  # 🎯 CMS Admin Panel
│   ├── index.html          # Admin interface
│   ├── config.yml          # CMS configuration
│   ├── README.md           # Admin documentation
│   └── netlify-identity-snippet.html  # Identity widget
├── content/                # 📝 CMS Content (JSON/Markdown)
│   ├── blog/               # Blog posts
│   ├── portfolio/          # Portfolio projects
│   ├── services/           # Services
│   ├── team/               # Team members
│   ├── testimonials/       # Testimonials
│   ├── faq/                # FAQ
│   ├── pricing/            # Pricing plans
│   ├── pages/              # Custom pages
│   ├── homepage/           # Homepage sections
│   ├── navigation/         # Navigation menus
│   ├── messages/           # Contact messages
│   ├── gallery/            # Media gallery
│   └── settings/           # Site settings
├── netlify.toml            # Netlify configuration
├── _redirects              # URL redirects
├── _headers                # HTTP headers
├── robots.txt              # SEO robots file
├── sitemap.xml             # SEO sitemap
├── 404.html                # Custom 404 page
├── README.md               # This file
├── DEPLOYMENT.md           # Deployment guide
├── CMS_SETUP_GUIDE.md      # CMS setup instructions
├── CMS_FEATURES.md         # CMS features documentation
└── QUICK_START_ADMIN.md    # Quick CMS setup guide
```

## 🔧 Local Development

To run locally:

```bash
# Using Python
python -m http.server 8000

# Using Node.js http-server
npx http-server -p 8000

# Using PHP
php -S localhost:8000
```

Then open `http://localhost:8000` in your browser.

## 📝 Configuration Files

### netlify.toml
Main configuration file for Netlify deployment, including:
- Build settings
- Custom redirects
- Security headers
- Performance optimization
- Asset caching

### _redirects
URL redirect rules for:
- Custom domain enforcement
- HTTPS enforcement
- 404 handling

### _headers
HTTP headers for:
- Security (XSS, CSRF protection)
- Performance (caching)
- Privacy (referrer policy)

## 🔒 Security Features

- HTTPS enforcement
- X-Frame-Options: SAMEORIGIN
- X-XSS-Protection enabled
- X-Content-Type-Options: nosniff
- Referrer-Policy: strict-origin-when-cross-origin
- Permissions-Policy configured

## ⚡ Performance Optimization

- Static asset caching (1 year)
- HTML caching (1 hour)
- CDN delivery via Netlify
- Optimized headers

## 📦 Deployment Process

1. Push changes to GitHub repository
2. Netlify automatically detects changes
3. Netlify builds and deploys the site
4. Site is live at `lumakara.web.id`

## 🆘 Support

For issues or questions, contact:
- **Email**: taufiknrr.mail@gmail.com
- **GitHub**: [Repository Issues](https://github.com/iamtaufiknrr/lumakara_website_01/issues)

---

© 2024 Lumakara. All rights reserved.
