# XState Skill

<!--
📏 Skill File Length Guidance:
- No hard token limits - Claude Code uses progressive disclosure (loads only when needed)
- Focus on clarity over brevity
- If this file becomes unwieldy (>500 lines or covering too many concepts), consider splitting into multiple focused skills
- Current approach: One comprehensive XState skill with organized sections
-->

Expert guidance for using XState state machines and the actor model in JavaScript, TypeScript, and React projects.

## When to Use This Skill

Invoke this skill when:

- Implementing state machines or statecharts
- Managing complex application state with XState
- Using the actor model for concurrent state management
- Integrating XState with React components
- Debugging or visualizing state machines

## Core Principles

- Model behavior as finite state machines
- Use explicit transitions over implicit state changes
- Leverage guards for conditional transitions
- Use actions for side effects
- Keep machines pure and testable
- Keep context serializable - avoid storing object instances (improves Stately Inspector compatibility)
- Store only metadata in context, create disposable instances on-demand in invoke input functions

## Machine Patterns

### Basic Machine Structure

**Context Design:**

- Store metadata and primitives (numbers, strings, enums, simple objects)
- Avoid storing object instances (better serialization and debugging)
- Keep context serializable for Stately Inspector compatibility

### State Hierarchy

**Final States Pattern:**
Use nested states with a sibling final state for sequential flows:

```typescript
ParentState: {
  initial: 'Step1',
  states: {
    Step1: {
      on: { NEXT: 'Step2' }
    },
    Step2: {
      on: { COMPLETE: 'Done' }
    },
    Done: {
      type: 'final'
    }
  },
  onDone: {
    target: 'NextParentState'
  }
}
```

### Actions and Side Effects

**Parameterized Actions:**
Use parameterized actions for reusable logic with different values:

```typescript
actions: {
  updateValue: assign(({ context, event }, params: { key: string }) => ({
    [params.key]: event.value
  }))
}

// Usage
entry: { type: 'updateValue', params: { key: 'count' } }
```

**Entry Actions for Preparation:**
Use entry actions to prepare state before async operations:

```typescript
Moving: {
  entry: 'calculateMetadata', // Prepare before invoke
  invoke: {
    src: 'animationActor',
    input: ({ context }) => ({
      // Use prepared metadata
      duration: context.calculatedDuration
    })
  }
}
```

### Guards and Conditions

**Parameterized Guards:**
Use parameterized guards for reusable conditional logic:

```typescript
guards: {
  isGreaterThan: ({ context }, params: { value: number; key: string }) =>
    context[params.key] > params.value
}

// Usage
on: {
  SUBMIT: {
    guard: { type: 'isGreaterThan', params: { key: 'count', value: 0 } },
    target: 'Success'
  }
}
```

### Services and Invocations

**Disposable Instances Pattern:**
Create object instances on-demand in the input function rather than storing them in context. This is ideal for ephemeral objects that only exist for the duration of an invoked actor.

```typescript
// ❌ Anti-pattern: Storing instance in context
context: {
  animationInstance: AnimationObject | null; // Hard to serialize, memory leaks
}

// ✅ Better: Store only metadata in context
context: {
  duration: number;
  speed: number;
  target: Position;
}

// Create instance on-demand in invoke
Processing: {
  entry: 'calculateMetadata', // Prepare metadata first
  invoke: {
    src: 'processingActor',
    input: ({ context }) => {
      // Create disposable instance here
      const instance = new ProcessingObject({
        duration: context.duration,
        speed: context.speed,
        target: context.target
      });

      return { instance, config: context };
    },
    onDone: { target: 'Complete' }
  }
}
```

**Benefits:**

- Automatic garbage collection when actor completes
- Better serialization (context has no object instances)
- Stately Inspector compatibility
- No manual cleanup needed
- Prevents memory leaks

**Event Narrowing with assertEvent:**
Use `assertEvent` in invoke input to narrow event types:

```typescript
invoke: {
  src: 'dataActor',
  input: ({ event }) => {
    assertEvent(event, 'FETCH_DATA');
    // TypeScript now knows event.data exists
    return { id: event.data.id };
  }
}
```

## TypeScript Integration

<!-- Add TypeScript-specific patterns -->
<!-- Example:
- Typing context
- Typing events (discriminated unions)
- Typing actions and services
- Type inference helpers
- Generated types from machines
-->

## React Integration

### Using @xstate/react

<!-- Add React-specific patterns -->
<!-- Example:
- useMachine hook patterns
- useActor hook usage
- useSelector for derived state
- Actor providers and context
-->

### Component Architecture

<!-- Add component organization patterns -->
<!-- Example:
- Where to place machine definitions
- Separating machines from components
- Sharing machines across components
- Testing components with machines
-->

### State-Driven UI

**Use Tags for Multiple State Checks:**
When checking multiple states with OR logic, use tags instead of multiple `state.matches()` calls:

```typescript
// ❌ Verbose: Multiple matches
if (state.matches('loading') || state.matches('submitting') || state.matches('validating')) {
  return <Spinner />;
}

// ✅ Better: Use tags
// In machine definition:
states: {
  loading: { tags: 'busy' },
  submitting: { tags: 'busy' },
  validating: { tags: 'busy' }
}

// In component:
if (state.hasTag('busy')) {
  return <Spinner />;
}
```

## Actor Model

**Passing Parent Actor Reference:**
Child actors can receive and type the parent actor reference for bidirectional communication:

```typescript
// Parent machine
const parentMachine = setup({
	actors: {
		childActor: childMachine,
	},
}).createMachine({
	// ...
	invoke: {
		src: 'childActor',
		input: ({ self }) => ({
			parentRef: self, // Pass parent reference to child
		}),
	},
});

// Child machine
const childMachine = setup({
	types: {
		input: {} as {
			parentRef: ActorRefFrom<typeof parentMachine>; // Type the parent ref
		},
	},
}).createMachine({
	// Child can now send events to parent
	entry: ({ input }) => {
		input.parentRef.send({ type: 'CHILD_READY' });
	},
});
```

## Testing

<!-- Add testing strategies -->
<!-- Example:
- Testing state transitions
- Testing guards and actions
- Mocking services
- Testing React components with machines
- Snapshot testing
-->

## Visualization and Debugging

<!-- Add debugging tips -->
<!-- Example:
- Using @xstate/inspect
- Visualizing with Stately Studio
- Dev tools integration
- Logging strategies
-->

## Common Patterns and Recipes

<!-- Add your frequently-used patterns -->
<!-- Example:
- Form state machines
- Fetch/retry patterns
- Multi-step workflows
- Authentication flows
- Polling patterns
-->

## Anti-Patterns to Avoid

<!-- Add things to avoid -->
<!-- Example:
- Overusing context instead of states
- Too many nested states
- Side effects in guards
- Coupling machines too tightly to UI
-->

## File Organization

<!-- Add your preferred project structure -->
<!-- Example:
- /machines/feature-name.machine.ts
- Co-locating machines with features
- Shared machines location
- Type definitions location
-->

## Naming Conventions

**State Machine Configuration:**
- **State names**: Title Case (e.g., `Idle`, `Loading Data`, `Processing Complete`)
- **Event types**: Sentence case (e.g., `Submit form`, `Data loaded`, `Cancel operation`)
- **Guard types**: lowercase with spaces, natural language (e.g., `if something meets this condition`, `if user is authenticated`)
- **Action types**: camelCase (e.g., `loadData`, `updateContext`, `sendNotification`)
- **Delay names**: camelCase (e.g., `retryDelay`, `debounceTimeout`, `pollingInterval`)
- **Machine names**: camelCase with "Machine" suffix (e.g., `authMachine`, `formMachine`)

## Resources and References

**Official Documentation:**

- [XState and Stately Documentation](https://stately.ai/docs) - Official docs for XState v5 and Stately tools
- [XState API Reference](https://stately.ai/docs/api) - Complete API documentation
- [Stately Studio](https://stately.ai/studio) - Visual editor for state machines
- [XState GitHub](https://github.com/statelyai/xstate) - Source code and examples

**Learning Resources:**

- [XState Catalogue](https://stately.ai/docs/catalogue) - Common state machine patterns
- [XState Examples](https://stately.ai/docs/examples) - Real-world examples

---

**Usage**: Invoke this skill with `@xstate.md` or when Claude detects XState-related work.

---

## 📥 Raw Ideas & Notes (Work in Progress)

<!--
⚠️ IMPORTANT FOR CLAUDE CODE:
This section is for capturing unorganized ideas and notes.
DO NOT use content from this section when providing guidance.
Only reference the organized sections above.

This is a staging area for ideas that will later be moved into the appropriate sections.
-->

<!--
Paste your raw ideas, code snippets, tips, and notes below.
No need to organize them yet - just dump them here!
Later, you and Claude can work together to integrate them into the proper sections above.

Example format:
- Random idea about using assign()
- Code snippet for retry pattern
- Link to article about actor model
- Note about debugging technique
-->

### Unsorted Ideas

<!-- Your ideas go here -->
