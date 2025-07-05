export async function fetchWithRetry(
  url: string,
  options: RequestInit = {},
  retries: number = 3,
  backoff: number = 300
): Promise<Response> {
  let lastError: any;
  for (let attempt = 0; attempt < retries; attempt++) {
    try {
      const response = await fetch(url, options);
      if (!response.ok) throw new Error(`HTTP error: ${response.status}`);
      return response;
    } catch (err) {
      lastError = err;
      if (attempt < retries - 1) await new Promise(res => setTimeout(res, backoff * (attempt + 1)));
    }
  }
  throw lastError;
}