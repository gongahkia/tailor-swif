/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  experimental: {
    appDir: true
  },
  images: {
    domains: ["your-s3-bucket.amazonaws.com"]
  },
  env: {
    NEXT_PUBLIC_API_BASE_URL: process.env.NEXT_PUBLIC_API_BASE_URL,
    NEXT_PUBLIC_MAPS_API_KEY: process.env.NEXT_PUBLIC_MAPS_API_KEY
  }
};

module.exports = nextConfig;