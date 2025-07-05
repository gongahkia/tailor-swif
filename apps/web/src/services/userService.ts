import { fetchWithRetry } from "../utils/fetchWithRetry";
import { CreateUserRequest, UserResponse } from "@tailor-swif/types";

export async function createUser(data: CreateUserRequest): Promise<UserResponse> {
  const res = await fetchWithRetry("/api/users", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
  });
  return res.json();
}