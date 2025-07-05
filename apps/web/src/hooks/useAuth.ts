import { useUser } from "@clerk/nextjs";

export function useAuth() {
  const { user, isLoaded, isSignedIn } = useUser();
  return { user, isLoaded, isSignedIn };
}