import { ClerkProvider } from '@clerk/nextjs';
import { Inter } from 'next/font/google';
import '../styles/globals.css';

const inter = Inter({ subsets: ['latin'] });

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <ClerkProvider>
      <html lang="en">
        <head />
        <body className={inter.className}>
          {children}
        </body>
      </html>
    </ClerkProvider>
  );
}