'use client';
import { SignIn } from '@clerk/nextjs';

export default function LoginPage() {
  return (
    <div style={{ display: 'flex', justifyContent: 'center', marginTop: 40 }}>
      <SignIn path="/login" routing="path" signUpUrl="/signup" />
    </div>
  );
}