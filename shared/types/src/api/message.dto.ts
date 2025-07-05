import { MessageType } from "../enums";

export interface SendMessageRequest {
  threadId: string;
  recipientId: string;
  type: MessageType;
  content: string;
  voiceUrl?: string;
}

export interface MessageResponse {
  id: string;
  threadId: string;
  senderId: string;
  recipientId: string;
  type: MessageType;
  content: string;
  voiceUrl?: string;
  createdAt: string;
  read: boolean;
}