import { NextRequest, NextResponse } from "next/server";
import { getAuth } from "@clerk/nextjs/server";

export function authGuard(request: NextRequest) {
  const { userId } = getAuth(request);
  if (!userId) {
    return NextResponse.redirect(new URL("/login", request.url));
  }
  return NextResponse.next();
}