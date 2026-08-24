import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  // GitHub Pages serves this project under /today-sun-like/, so absolute asset
  // paths would 404. Relative ones work there and at the root alike.
  base: './',
  plugins: [react(), tailwindcss()],
})
