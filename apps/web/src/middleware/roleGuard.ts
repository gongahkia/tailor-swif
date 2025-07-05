import { NextRequest, NextResponse } from "next/server";
import { getAuth } from "@clerk/nextjs/server";
import { UserRole } from "@tailor-swif/types";

export function roleGuard(request: NextRequest, allowedRoles: UserRole[]) {
  const { userId, sessionClaims } = getAuth(request);
  if (!userId || !sessionClaims?.role || !allowedRoles.includes(sessionClaims.role)) {
    return NextResponse.redirect(new URL("/dashboard", request.url));
  }
  return NextResponse.next();
}