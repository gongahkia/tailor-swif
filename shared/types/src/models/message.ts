import { MessageType } from "../enums";

export interface Message {
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