export function formatDate(
  date: Date | string,
  locale: string = "en-SG",
  options: Intl.DateTimeFormatOptions = {
    year: "numeric",
    month: "short",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit"
  }
): string {
  const d = typeof date === "string" ? new Date(date) : date;
  return new Intl.DateTimeFormat(locale, options).format(d);
}

export function formatCurrency(
  amount: number,
  currency: string = "SGD",
  locale: string = "en-SG"
): string {
  return new Intl.NumberFormat(locale, {
    style: "currency",
    currency
  }).format(amount);
}