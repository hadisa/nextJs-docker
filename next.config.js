/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,

  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "react/jsx-runtime": ["node_modules/react/jsx-runtime"],
      "react": ["node_modules/react"]
    }
  }
}

module.exports = nextConfig
