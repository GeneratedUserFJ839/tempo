//! Store module for persisting consensus-related data using reth's database infrastructure.
//!
//! This module provides storage functionality for:
//! - Decided values (committed blocks with their certificates)
//! - Undecided proposals (pending block proposals)
//! - Consensus state information
//!
//! The store integrates with reth's database layer to provide persistent storage
//! for the consensus engine's data requirements.

mod reth_store;
mod tables;
mod wrapper;

pub use reth_store::{RethStore, StoreError};
pub use tables::{DecidedValue, StoredProposal};
pub use wrapper::Store;