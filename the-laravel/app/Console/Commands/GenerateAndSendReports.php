<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use PDF;
use App\Mail\ReportMail;
use Barryvdh\DomPDF\Facade\Pdf as FacadePdf;

class GenerateAndSendReports extends Command
{
    protected $signature = 'reports:generate-send';
    protected $description = 'Generate and send reports to participants';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $participants = DB::table('participants')->get();

        foreach ($participants as $participant) {
            $reportData = $this->generateReportForParticipant($participant->id);

            // Generate PDF
            $pdf = FacadePdf::loadView('pdf.report', ['reportData' => $reportData]);

            // Save PDF to a file
            $pdfPath = storage_path('../../reports/' . $participant->username . '_challenge_report.pdf');
            $pdf->save($pdfPath);

            // Send the report via email
            // Mail::to($participant->email)->send(new ReportMail($pdfPath));
        }

        $this->info('Reports generated and sent successfully.');
    }

    private function generateReportForParticipant($participantId)
    {
        $reportData = DB::table('participant_attempts')
            ->join('challenges', 'participant_attempts.challenge_id', '=', 'challenges.id')
            ->join('questions', 'participant_attempts.question_id', '=', 'questions.id')
            ->join('participants', 'participant_attempts.participant_id', '=', 'participants.id')
            ->select(
                'participants.*',
                'challenges.name as challenge_name',
                'questions.*',
                'participant_attempts.is_correct',
                'participant_attempts.score',
                'participant_attempts.time_taken'
            )
            ->where('participant_attempts.participant_id', $participantId)
            ->get();

        // dd($reportData);
        return $reportData;
    }

}

