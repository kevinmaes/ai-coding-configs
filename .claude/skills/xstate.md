# XState Skill

Expert guidance for using XState state machines and the actor model in JavaScript, TypeScript, and React projects.

## When to Use This Skill

Invoke this skill when:

- Implementing state machines or statecharts
- Managing complex application state with XState
- Using the actor model for concurrent state management
- Integrating XState with React components
- Debugging or visualizing state machines

## Core Principles

<!-- Add your fundamental XState principles here -->
<!-- Example:
- Model behavior as finite state machines
- Use explicit transitions over implicit state changes
- Leverage guards for conditional transitions
- Use actions for side effects
- Keep machines pure and testable
-->

## Machine Patterns

### Basic Machine Structure

<!-- Add your preferred machine setup patterns -->
<!-- Example:
- How to organize states
- Naming conventions for states and events
- Context vs state data decisions
-->

### State Hierarchy

<!-- Add patterns for nested/hierarchical states -->
<!-- Example:
- When to use parallel states
- Parent-child state relationships
- History states usage
-->

### Actions and Side Effects

<!-- Add your conventions for actions -->
<!-- Example:
- Inline actions vs named actions
- Action creators
- Entry/exit actions
- Assign actions for context updates
-->

### Guards and Conditions

<!-- Add guard patterns and best practices -->
<!-- Example:
- Inline vs named guards
- Pure guard functions
- Complex conditional logic
-->

### Services and Invocations

<!-- Add patterns for async operations -->
<!-- Example:
- Promise-based services
- Callback services
- Observable services
- Actor invocation patterns
-->

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

<!-- Add UI rendering patterns -->
<!-- Example:
- Matching states for conditional rendering
- Using state values for styling
- Handling loading/error states
- Optimistic updates
-->

## Actor Model

<!-- Add actor model patterns -->
<!-- Example:
- Spawning actors
- Actor communication
- Parent-child relationships
- Actor lifecycle management
-->

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

<!-- Add your naming standards -->
<!-- Example:
- State names: SCREAMING_SNAKE_CASE or camelCase
- Event names: UPPER_CASE
- Action names: camelCase
- Machine names: camelCase + "Machine" suffix
-->

## Resources and References

<!-- Add helpful links and resources -->
<!-- Example:
- Official XState docs
- Stately Studio
- Common examples
- Community patterns
-->

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

# Kevin’s Best Practices & Tips

- Parameterized actions and guards
- Event narrowing with `assertEvent` in invoke input
- Use nested states and a sibling state with `type: 'final'` and then an `onDone: { target: 'The Next State' }` on the parent of the nested state.
- Pass in parent ref and type it
  - Maybe show slide
- Many instances of `state.matches() || state.matches()` you can use tags on multiple states and then `state.hasTag()`
