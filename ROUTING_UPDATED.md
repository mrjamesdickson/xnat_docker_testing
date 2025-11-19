# XNAT Plugin Routing - Updated

**Date:** 2025-11-16
**Plugins:** Query Plugin v1.0.0, Compliance Plugin v0.1.0

---

## ✅ Updated Routing

### Query Plugin Routes

| URL | Behavior | Description |
|-----|----------|-------------|
| `/xapi/query` | Serves query management UI | **Default** - Query management dashboard |
| `/xapi/query/management` | Serves query management UI | Query management dashboard (explicit) |
| `/xapi/query/dashboard` | **Redirects** to `/xapi/compliance/dashboard` | Redirects to compliance plugin |
| `/xapi/query/admin/statistics` | JSON API | Query statistics endpoint |
| `/xapi/query/aging/*` | JSON API | Aging buckets & SLA endpoints |
| `/xapi/query/sla/*` | JSON API | SLA rules & evaluation |

### Compliance Plugin Routes

| URL | Behavior | Description |
|-----|----------|-------------|
| `/xapi/compliance` | Serves compliance dashboard UI | **Default** - Compliance dashboard |
| `/xapi/compliance/dashboard` | Serves compliance dashboard UI | Compliance dashboard (explicit) |
| `/xapi/compliance/metrics` | JSON API | Aggregated compliance metrics |
| `/xapi/compliance/heatmap` | JSON API | Site compliance heatmap |
| `/xapi/compliance/timeline` | JSON API | Subject timeline data |
| `/xapi/compliance/trends/*` | JSON API | Historical trend data |

---

## 🔄 What Changed

### Before (Confusing):
- `/xapi/query` → Served React app (unclear purpose)
- `/xapi/query/dashboard` → Served compliance dashboard (wrong plugin!)
- `/xapi/query/management` → Served query management (redundant)
- No `/xapi/compliance` UI routes

### After (Clear):
- ✅ `/xapi/query` → **Query Management Dashboard** (default)
- ✅ `/xapi/query/dashboard` → **Redirects to `/xapi/compliance/dashboard`**
- ✅ `/xapi/compliance` → **Compliance Dashboard** (default)
- ✅ Clear separation: queries vs. compliance

---

## 📂 Architecture

```
Query Plugin (/xapi/query)
├── UI: Query Management Dashboard
├── Serves: /query/management, /query (default)
├── Redirects: /query/dashboard → /compliance/dashboard
└── APIs: statistics, aging, SLA

Compliance Plugin (/xapi/compliance)
├── UI: Compliance Dashboard (when built)
├── Serves: /compliance/dashboard, /compliance (default)
├── Fallback: Redirects to /query/management (until UI built)
└── APIs: metrics, heatmap, timeline, trends
```

---

## 🎯 User Experience

### For Query Management:
**Access:** http://localhost/xapi/query
**Shows:** Query list, filters, SLA tracking, aging buckets

### For Compliance Dashboard:
**Access:** http://localhost/xapi/compliance
**Shows:** Aggregated compliance metrics across all data sources
**Currently:** Falls back to query management (UI not yet built)

**Once UI Built:**
Shows multi-plugin compliance aggregation with:
- Query statistics
- Training compliance
- XNAT project stats
- QC metrics

---

## 🔧 Temporary State

### Compliance Dashboard UI
**Status:** Not yet built (requires Node 18+, currently Node 14)

**Current Behavior:**
- `/xapi/compliance` → Redirects to `/xapi/query/management` (fallback)
- `/xapi/compliance/dashboard` → Redirects to `/xapi/query/management` (fallback)

**After Building UI:**
- `/xapi/compliance` → Serves compliance dashboard React app
- `/xapi/compliance/dashboard` → Serves compliance dashboard React app

### To Build Compliance UI:
```bash
# Install Node 18+
nvm install 18
nvm use 18

# Build compliance plugin with UI
cd /Users/james/projects/xnat_compliance_plugin
./gradlew clean build

# Redeploy
cd /Users/james/projects/xnat_docker_testing
./deploy_both_plugins.sh
```

---

## 📊 Data Flow

```
User Browser
    ↓
┌───────────────────────────────────────┐
│  Query Management Dashboard           │
│  URL: /xapi/query                     │
│  Plugin: xnat_query_plugin            │
│  Purpose: Manage queries, SLA, aging  │
└───────────────────────────────────────┘
    ↓ calls
┌───────────────────────────────────────┐
│  Query Plugin APIs                    │
│  /xapi/query/admin/statistics         │
│  /xapi/query/aging/*                  │
│  /xapi/query/sla/*                    │
└───────────────────────────────────────┘

User Browser
    ↓
┌───────────────────────────────────────┐
│  Compliance Dashboard                 │
│  URL: /xapi/compliance                │
│  Plugin: xnat_compliance_plugin       │
│  Purpose: Cross-plugin compliance     │
└───────────────────────────────────────┘
    ↓ calls
┌───────────────────────────────────────┐
│  Compliance Plugin APIs               │
│  (Aggregates from multiple sources)   │
│  /xapi/compliance/metrics             │
│    ↓ fetches from                     │
│  • /xapi/query/statistics             │
│  • /xapi/training/metrics             │
│  • /data/projects/*                   │
│  • /xapi/qc/status                    │
└───────────────────────────────────────┘
```

---

## 🧪 Testing Routing

### Test Query Plugin:
```bash
# Should serve query management
curl -I http://localhost/xapi/query

# Should serve query management
curl -I http://localhost/xapi/query/management

# Should redirect to compliance
curl -I http://localhost/xapi/query/dashboard
# Expect: HTTP 302 → /xapi/compliance/dashboard
```

### Test Compliance Plugin:
```bash
# Should serve compliance dashboard (or fallback)
curl -I http://localhost/xapi/compliance

# Should serve compliance dashboard (or fallback)
curl -I http://localhost/xapi/compliance/dashboard

# Should return JSON metrics
curl http://localhost/xapi/compliance/metrics
```

---

## 📝 Summary

| Route | Plugin | Purpose | Status |
|-------|--------|---------|--------|
| `/xapi/query` | Query | Query management | ✅ Working |
| `/xapi/query/dashboard` | Query | Redirect to compliance | ✅ Working |
| `/xapi/compliance` | Compliance | Compliance dashboard | ⚠️ Fallback (UI pending) |
| `/xapi/compliance/metrics` | Compliance | API aggregation | ✅ Working |

**Next Step:** Build compliance plugin UI with Node 18+ to complete the separation.

---

**Last Updated:** 2025-11-16 17:45 UTC
**XNAT:** localhost
**Status:** ✅ Deployed & Running
