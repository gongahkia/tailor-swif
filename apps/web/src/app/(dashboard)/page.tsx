import { currentUser } from '@clerk/nextjs/server';
import { redirect } from 'next/navigation';

export default async function DashboardPage() {
  const user = await currentUser();
  if (!user) redirect('/login');
  return (
    <main>
      <h1>Welcome, {user.firstName || user.emailAddress}!</h1>
      <p>This is your dashboard.</p>
    </main>
  );
}