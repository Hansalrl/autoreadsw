# Menggunakan image node:18
FROM node:18

# Menginstal PM2
RUN npm install -g pm2

# Menentukan direktori kerja
WORKDIR /home/rumah

# Menyalin package.json ke dalam image
COPY package.json .

# Menginstal dependensi
RUN npm install

# Menyalin seluruh aplikasi ke dalam image
COPY . .

# Expose port 5000 untuk Heroku
EXPOSE 5000

# Menjalankan PM2 Runtime
CMD ["pm2-runtime", "start", "index.js", "--name", "bot"]
