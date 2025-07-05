'use client';
import { useEffect, useState } from 'react';
import { MessageResponse } from '@tailor-swif/types';
import { fetchWithRetry } from '../../utils';

export default function MessagesPage() {
  const [messages, setMessages] = useState<MessageResponse[]>([]);
  useEffect(() => {
    fetchWithRetry('/api/messages')
      .then(res => res.json())
      .then(setMessages);
  }, []);
  return (
    <main>
      <h1>Messages</h1>
      <ul>
        {messages.map(msg => (
          <li key={msg.id}>
            <span>{msg.content}</span>
            <span style={{ marginLeft: 8, color: '#888' }}>
              {new Date(msg.createdAt).toLocaleString()}
            </span>
          </li>
        ))}
      </ul>
    </main>
  );
}