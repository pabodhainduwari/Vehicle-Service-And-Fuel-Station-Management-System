export default function AdminTherapyBookings({ bookings, confirmBooking, rejectBooking }) {
  return (
    <div className="bg-white rounded-xl shadow-md p-6 overflow-x-auto">
      <h3 className="text-xl font-semibold mb-4">Therapy Bookings</h3>
      <table className="w-full border-collapse">
        <thead>
          <tr className="bg-yellow-500 text-black">
            <th className="p-3">ID</th>
            <th className="p-3">Name</th>
            <th className="p-3">Phone</th>
            <th className="p-3">Email</th>
            <th className="p-3">Type</th>
            <th className="p-3">Date</th>
            <th className="p-3">Time</th>
            <th className="p-3">Therapist</th>
            <th className="p-3">Notes</th>
            <th className="p-3">Status</th>
            <th className="p-3">Action</th>
          </tr>
        </thead>
        <tbody>
          {bookings.map((b, index) => (
            <tr
              key={b._id}
              className={`${
                index % 2 === 0 ? "bg-gray-50" : "bg-white"
              } hover:bg-gray-100 transition`}
            >
              <td className="p-3">{b.bookingId}</td>
              <td className="p-3">{b.firstName} {b.lastName}</td>
              <td className="p-3">{b.contactNumber}</td>
              <td className="p-3">{b.email}</td>
              <td className="p-3">{b.therapyType}</td>
              <td className="p-3">{new Date(b.preferredDate).toLocaleDateString()}</td>
              <td className="p-3">{b.preferredTime}</td>
              <td className="p-3">{b.therapistName}</td>
              <td className="p-3">{b.additionalNotes}</td>
              <td className="p-3">
                <span
                  className={`px-3 py-1 rounded-full text-sm font-semibold
                  ${
                    b.status === "Pending"
                      ? "bg-yellow-100 text-yellow-600"
                      : b.status === "Confirmed"
                      ? "bg-green-100 text-green-600"
                      : "bg-red-100 text-red-600"
                  }`}
                >
                  {b.status}
                </span>
              </td>
              <td className="p-3 space-x-2">
                {b.status === "Pending" && (
                  <>
                    <button
                      onClick={() => confirmBooking(b._id)}
                      className="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition"
                    >
                      Confirm
                    </button>
                    <button
                      onClick={() => rejectBooking(b._id)}
                      className="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition"
                    >
                      Reject
                    </button>
                  </>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
