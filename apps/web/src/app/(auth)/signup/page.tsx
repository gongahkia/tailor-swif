'use client';
import { SignUp } from '@clerk/nextjs';

export default function SignupPage() {
  return (
    <div style={{ display: 'flex', justifyContent: 'center', marginTop: 40 }}>
      <SignUp path="/signup" routing="path" signInUrl="/login" />
    </div>
  );
}