'use client';
import { useEffect, useState } from 'react';
import { TailorResponse } from '@tailor-swif/types';
import { fetchWithRetry } from '../../utils';

export default function TailorDirectoryPage() {
  const [tailors, setTailors] = useState<TailorResponse[]>([]);
  useEffect(() => {
    fetchWithRetry('/api/tailors')
      .then(res => res.json())
      .then(setTailors);
  }, []);
  return (
    <main>
      <h1>Tailor Directory</h1>
      <ul>
        {tailors.map(tailor => (
          <li key={tailor.id}>
            <strong>{tailor.name}</strong> ({tailor.type})<br />
            {tailor.address}
          </li>
        ))}
      </ul>
    </main>
  );
}