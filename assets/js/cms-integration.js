/**
 * Lumakara CMS Integration Script
 * Connects Decap CMS content to website pages
 * Author: Taufik Nur Rahman Ridwan
 */

(function() {
    'use strict';

    const CMS_Integration = {
        
        /**
         * Load and parse JSON content
         */
        loadJSON: async function(url) {
            try {
                const response = await fetch(url);
                if (!response.ok) throw new Error('Failed to load content');
                return await response.json();
            } catch (error) {
                console.error('Error loading JSON:', error);
                return null;
            }
        },

        /**
         * Load and parse Markdown content
         */
        loadMarkdown: async function(url) {
            try {
                const response = await fetch(url);
                if (!response.ok) throw new Error('Failed to load content');
                const text = await response.text();
                return this.parseMarkdown(text);
            } catch (error) {
                console.error('Error loading Markdown:', error);
                return null;
            }
        },

        /**
         * Parse Markdown front matter and content
         */
        parseMarkdown: function(text) {
            const frontMatterRegex = /^---\s*\n([\s\S]*?)\n---\s*\n([\s\S]*)$/;
            const match = text.match(frontMatterRegex);
            
            if (!match) return { frontMatter: {}, content: text };
            
            const frontMatter = this.parseFrontMatter(match[1]);
            const content = match[2];
            
            return { frontMatter, content };
        },

        /**
         * Parse YAML front matter
         */
        parseFrontMatter: function(yaml) {
            const lines = yaml.split('\n');
            const data = {};
            
            lines.forEach(line => {
                const colonIndex = line.indexOf(':');
                if (colonIndex > -1) {
                    const key = line.substring(0, colonIndex).trim();
                    let value = line.substring(colonIndex + 1).trim();
                    
                    // Remove quotes
                    if ((value.startsWith('"') && value.endsWith('"')) || 
                        (value.startsWith("'") && value.endsWith("'"))) {
                        value = value.slice(1, -1);
                    }
                    
                    data[key] = value;
                }
            });
            
            return data;
        },

        /**
         * Convert Markdown to HTML (basic)
         */
        markdownToHTML: function(markdown) {
            if (!markdown) return '';
            
            let html = markdown;
            
            // Headers
            html = html.replace(/^### (.*$)/gim, '<h3>$1</h3>');
            html = html.replace(/^## (.*$)/gim, '<h2>$1</h2>');
            html = html.replace(/^# (.*$)/gim, '<h1>$1</h1>');
            
            // Bold
            html = html.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>');
            
            // Italic
            html = html.replace(/\*(.+?)\*/g, '<em>$1</em>');
            
            // Links
            html = html.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2">$1</a>');
            
            // Images
            html = html.replace(/!\[([^\]]*)\]\(([^)]+)\)/g, '<img src="$2" alt="$1" />');
            
            // Line breaks
            html = html.replace(/\n\n/g, '</p><p>');
            html = '<p>' + html + '</p>';
            
            return html;
        },

        /**
         * Load Site Settings
         */
        loadSettings: async function() {
            const settings = {};
            
            settings.general = await this.loadJSON('/content/settings/general.json');
            settings.social = await this.loadJSON('/content/settings/social.json');
            settings.seo = await this.loadJSON('/content/settings/seo.json');
            
            return settings;
        },

        /**
         * Apply Site Settings to Page
         */
        applySettings: function(settings) {
            if (!settings) return;
            
            // Update page title
            if (settings.general && settings.general.site_title) {
                const titleSuffix = ' - ' + settings.general.site_title;
                if (!document.title.includes(settings.general.site_title)) {
                    document.title += titleSuffix;
                }
            }
            
            // Update meta description
            if (settings.seo && settings.seo.meta_description) {
                let metaDesc = document.querySelector('meta[name="description"]');
                if (metaDesc) {
                    metaDesc.setAttribute('content', settings.seo.meta_description);
                }
            }
            
            // Update social links
            if (settings.social) {
                this.updateSocialLinks(settings.social);
            }
        },

        /**
         * Update Social Media Links
         */
        updateSocialLinks: function(social) {
            Object.keys(social).forEach(platform => {
                const links = document.querySelectorAll(`a[href*="${platform}"]`);
                links.forEach(link => {
                    if (social[platform]) {
                        link.setAttribute('href', social[platform]);
                    }
                });
            });
        },

        /**
         * Load Navigation Menu
         */
        loadNavigation: async function() {
            const mainMenu = await this.loadJSON('/content/navigation/main-menu.json');
            const footerMenu = await this.loadJSON('/content/navigation/footer-menu.json');
            
            return { mainMenu, footerMenu };
        },

        /**
         * Load Blog Posts
         */
        loadBlogPosts: async function(limit = null) {
            try {
                const response = await fetch('/content/blog/');
                // Note: This would need a directory listing or index file
                // For now, return sample structure
                return [];
            } catch (error) {
                console.error('Error loading blog posts:', error);
                return [];
            }
        },

        /**
         * Load Homepage Content
         */
        loadHomepageContent: async function() {
            const hero = await this.loadJSON('/content/homepage/hero.json');
            const about = await this.loadJSON('/content/homepage/about.json');
            const features = await this.loadJSON('/content/homepage/features.json');
            
            return { hero, about, features };
        },

        /**
         * Update Hero Section
         */
        updateHeroSection: function(hero) {
            if (!hero) return;
            
            // Update hero heading
            const heroHeading = document.querySelector('.hero-heading, .banner-title, h1.main-title');
            if (heroHeading && hero.heading) {
                heroHeading.textContent = hero.heading;
            }
            
            // Update hero subheading
            const heroSubheading = document.querySelector('.hero-subheading, .banner-subtitle');
            if (heroSubheading && hero.subheading) {
                heroSubheading.textContent = hero.subheading;
            }
            
            // Update CTA button
            const ctaButton = document.querySelector('.hero-cta, .banner-btn');
            if (ctaButton && hero.cta_text) {
                ctaButton.textContent = hero.cta_text;
                if (hero.cta_url) {
                    ctaButton.setAttribute('href', hero.cta_url);
                }
            }
        },

        /**
         * Initialize CMS Integration
         */
        init: async function() {
            console.log('Initializing CMS Integration...');
            
            try {
                // Load settings
                const settings = await this.loadSettings();
                this.applySettings(settings);
                
                // Load navigation
                const navigation = await this.loadNavigation();
                
                // Store in global object for access
                window.LumakaraCMS = {
                    settings: settings,
                    navigation: navigation
                };
                
                console.log('CMS Integration initialized successfully');
            } catch (error) {
                console.error('Error initializing CMS:', error);
            }
        }
    };

    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => CMS_Integration.init());
    } else {
        CMS_Integration.init();
    }

    // Export to global scope
    window.CMS_Integration = CMS_Integration;

})();
