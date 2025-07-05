import { fetchWithRetry } from "../utils/fetchWithRetry";

export async function getTailors() {
  const res = await fetchWithRetry("/api/tailors");
  return res.json();
}

export async function getMessages() {
  const res = await fetchWithRetry("/api/messages");
  return res.json();
}

export async function getReviews() {
  const res = await fetchWithRetry("/api/reviews");
  return res.json();
}