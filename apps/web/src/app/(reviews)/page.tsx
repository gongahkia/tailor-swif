'use client';
import { useEffect, useState } from 'react';
import { ReviewResponse } from '@tailor-swif/types';
import { fetchWithRetry } from '../../utils';

export default function ReviewsPage() {
  const [reviews, setReviews] = useState<ReviewResponse[]>([]);
  useEffect(() => {
    fetchWithRetry('/api/reviews')
      .then(res => res.json())
      .then(setReviews);
  }, []);
  return (
    <main>
      <h1>Reviews</h1>
      <ul>
        {reviews.map(review => (
          <li key={review.id}>
            <strong>Rating:</strong> {review.rating} <br />
            <span>{review.comment}</span>
            <span style={{ marginLeft: 8, color: '#888' }}>
              {new Date(review.createdAt).toLocaleString()}
            </span>
          </li>
        ))}
      </ul>
    </main>
  );
}