import { createClient, SupabaseClient } from '@supabase/supabase-js'
const url = import.meta.env.VITE_SUPABASE_URL as string | undefined
const key = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined
export const supabaseReady = Boolean(url && key && !url.includes('YOUR_PROJECT') && !key.includes('YOUR_SUPABASE'))
export const supabase: SupabaseClient | null = supabaseReady ? createClient(url!, key!) : null
export const todayKey = () => new Date().toISOString().slice(0, 10)
export const uid = () => `${Date.now().toString(36)}-${Math.random().toString(36).slice(2, 8)}`
export function readStore<T>(key: string, fallback: T): T {
  try { const raw = localStorage.getItem(`shjisan:${key}`); return raw ? JSON.parse(raw) as T : fallback } catch { return fallback }
}
export function writeStore(key: string, value: unknown) {
  try { localStorage.setItem(`shjisan:${key}`, JSON.stringify(value)); return true } catch { return false }
}
export function formatDate(date: string) {
  if (!date) return 'No date'
  return new Date(`${date}T12:00:00`).toLocaleDateString(undefined, { month: 'short', day: 'numeric' })
}