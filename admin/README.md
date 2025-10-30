# 📝 Lumakara CMS Admin Panel

Welcome to the Lumakara Content Management System!

## 🌐 Access Admin Panel

**URL**: [http://lumakara.web.id/admin](http://lumakara.web.id/admin)

## 🔐 Authentication

This CMS uses **Netlify Identity** for secure authentication.

### First Time Setup:

1. **Enable Netlify Identity**
   - Go to Netlify Dashboard → Site Settings → Identity
   - Click "Enable Identity"
   
2. **Invite Users**
   - Go to Identity tab
   - Click "Invite users"
   - Enter email: `taufiknrr.mail@gmail.com`
   - User will receive invitation email
   
3. **Set Up Git Gateway**
   - Go to Site Settings → Identity → Services
   - Enable "Git Gateway"
   - This allows CMS to commit directly to GitHub

4. **Configure Registration**
   - Registration preferences: "Invite only" (recommended)
   - External providers: Optional (Google, GitHub, etc.)

### Login Process:

1. Visit [http://lumakara.web.id/admin](http://lumakara.web.id/admin)
2. Click "Login with Netlify Identity"
3. Enter your email and password
4. Access the admin dashboard

---

## 📚 Content Management Guide

### 1. **Blog Posts**

Manage all blog articles and news:

- **Create**: Click "Blog Posts" → "New Blog Post"
- **Fields**:
  - Title, Author, Date
  - Featured Image
  - Category and Tags
  - Content (Markdown editor)
  - SEO settings
- **Publish**: Click "Publish" to make live
- **Draft**: Save as draft for later

### 2. **Portfolio Projects**

Showcase your work:

- Add project details
- Upload project images
- Gallery support
- Client information
- Project categories

### 3. **Services**

Manage service offerings:

- Service descriptions
- Pricing information
- Features list
- Process steps
- Icons and images

### 4. **Team Members**

Add and manage team profiles:

- Name, position, photo
- Biography
- Social media links
- Skills and expertise

### 5. **Testimonials**

Client reviews and feedback:

- Client name and company
- Testimonial text
- Rating (1-5 stars)
- Featured testimonials

### 6. **FAQ**

Frequently Asked Questions:

- Question and answer
- Categories
- Display order

### 7. **Pricing Plans**

Manage pricing tiers:

- Plan name and price
- Features list
- Featured plans
- Call-to-action buttons

### 8. **Pages**

Create custom pages:

- Page title and content
- Custom permalink
- SEO settings
- Featured images

### 9. **Homepage Sections**

Edit homepage content:

- **Hero Section**: Main banner
- **About Section**: Company info
- **Features**: Key features grid

### 10. **Navigation Menus**

Manage site navigation:

- Main menu with submenus
- Footer menu columns
- Link ordering

### 11. **Site Settings**

Global settings:

- **General**: Site title, contact info
- **Social Media**: Social links
- **SEO**: Meta tags, analytics

### 12. **Contact Messages**

View form submissions:

- Read messages
- Mark as read/replied
- Archive messages

### 13. **Media Gallery**

Organize images:

- Upload images
- Add captions
- Categorize media
- Tag images

---

## 🎨 Content Workflow

### Editorial Workflow (3 stages):

1. **Draft** 📝
   - Content is being created
   - Not visible to public
   
2. **In Review** 👀
   - Content ready for review
   - Awaiting approval
   
3. **Ready** ✅
   - Content approved
   - Published to live site

### To Publish Content:

1. Create or edit content
2. Save changes
3. Set status to "Ready"
4. Click "Publish"
5. Changes automatically deployed to site

---

## 📝 Markdown Guide

The CMS uses Markdown for rich text editing:

```markdown
# Heading 1
## Heading 2
### Heading 3

**Bold text**
*Italic text*
~~Strikethrough~~

- Bullet list
- Another item

1. Numbered list
2. Another item

[Link text](https://example.com)

![Image alt text](/path/to/image.jpg)

> Blockquote

`Code inline`

\`\`\`
Code block
\`\`\`
```

---

## 🖼️ Media Management

### Upload Images:

1. Click the image field
2. Choose "Upload" or "Choose existing"
3. Select file from computer
4. Image automatically optimized
5. Stored in `/assets/images/uploads/`

### Best Practices:

- **Format**: Use JPG for photos, PNG for graphics
- **Size**: Optimize before upload (< 2MB recommended)
- **Naming**: Use descriptive filenames
- **Alt Text**: Always add alt text for SEO

---

## 🔍 SEO Best Practices

### For Each Content:

1. **Meta Title**: 50-60 characters
2. **Meta Description**: 150-160 characters
3. **Keywords**: 5-10 relevant keywords
4. **Images**: Add alt text
5. **URLs**: Use readable slugs
6. **Headers**: Use H1, H2, H3 hierarchy

---

## 🚀 Publishing & Deployment

### How It Works:

1. You create/edit content in CMS
2. Click "Publish"
3. CMS commits changes to GitHub
4. Netlify detects changes
5. Site automatically rebuilds
6. Changes live in ~30 seconds

### Check Deployment:

- Netlify Dashboard → Deploys
- See build status and logs
- Preview deploy before publishing

---

## 🛠️ Troubleshooting

### Can't Login?

- Check Netlify Identity is enabled
- Verify email invitation was sent
- Check spam folder for invitation
- Contact admin: taufiknrr.mail@gmail.com

### Changes Not Showing?

- Wait 30-60 seconds for deployment
- Check Netlify deploy status
- Clear browser cache
- Verify content is published (not draft)

### Media Upload Failed?

- Check file size (< 10MB)
- Verify file format (JPG, PNG, GIF)
- Check internet connection
- Try again or contact admin

### Lost Changes?

- All changes are versioned in Git
- Contact admin to recover
- Version history in GitHub

---

## 👥 User Roles

### Admin (Owner)
- Full access to all content
- Can manage users
- Site settings access

### Editor
- Create and publish content
- Manage media
- No settings access

### Contributor
- Create content (drafts only)
- Cannot publish
- Limited media access

---

## 📞 Support

### Need Help?

**Admin Contact:**
- **Name**: Taufik Nur Rahman Ridwan
- **Email**: taufiknrr.mail@gmail.com

**Useful Links:**
- [Decap CMS Documentation](https://decapcms.org/docs/)
- [Netlify Identity Docs](https://docs.netlify.com/visitor-access/identity/)
- [Markdown Guide](https://www.markdownguide.org/)

---

## 🔒 Security

### Best Practices:

1. **Strong Passwords**: Use 12+ characters
2. **2FA**: Enable two-factor authentication
3. **Invite Only**: Keep registration closed
4. **Regular Updates**: Check for CMS updates
5. **Backup**: Content backed up in GitHub

### Important Notes:

- Never share login credentials
- Log out after editing
- Use secure networks only
- Report suspicious activity

---

## 📊 Analytics & Monitoring

### Track Performance:

1. Google Analytics (if configured)
2. Netlify Analytics
3. Content performance metrics
4. User engagement data

---

## 🎯 Quick Actions

### Common Tasks:

| Task | Steps |
|------|-------|
| **Add Blog Post** | Blog Posts → New → Fill details → Publish |
| **Update Homepage** | Homepage → Hero/About/Features → Edit → Save |
| **Add Team Member** | Team Members → New → Add details → Publish |
| **Edit Contact Info** | Site Settings → General → Update → Save |
| **Upload Image** | Media Gallery → New → Upload → Save |

---

## 📅 Content Schedule

### Best Practices:

- **Blog**: Post 2-3 times per week
- **Portfolio**: Update monthly
- **Services**: Review quarterly
- **Team**: Update as needed
- **SEO**: Review monthly

---

## ✨ Tips & Tricks

1. **Preview Before Publishing**: Use draft mode
2. **SEO Optimization**: Fill all meta fields
3. **Image Optimization**: Compress before upload
4. **Consistent Formatting**: Use style guide
5. **Regular Backups**: Content auto-backed in Git
6. **Mobile Preview**: Check on mobile devices
7. **Link Checking**: Verify all links work
8. **Content Calendar**: Plan ahead

---

**Last Updated**: October 30, 2024  
**Version**: 1.0  
**Maintainer**: Taufik Nur Rahman Ridwan

---

*Happy Content Creating! 🚀*
